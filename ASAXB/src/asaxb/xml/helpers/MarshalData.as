package asaxb.xml.helpers
{
		
	import asaxb.xml.adapter.XMLAdapter;
	
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	
	import org.as3commons.reflect.AbstractMember;
	import org.as3commons.reflect.MetaData;
	import org.as3commons.reflect.Type;

	public class MarshalData
	{

		public static const XML_ROOT_NODE:String = "XmlRootNode";
		public static const XML_AS_TYPE_ADAPTER:String = "XmlASTypeAdapter";
		public static const XML_ATTRIBUTE:String = "XmlAttribute";
		public static const XML_ELEMENT:String = "XmlElement";
		public static const XML_ELEMENTS:String = "XmlElements";
		public static const XML_ELEMENT_WRAPPER:String = "XmlElementWrapper";

		private var _class:Class;
		private var _rootNodeName:String;
		private var _attributes:Array;
		private var _elements:Array;
		private var _elementsLists:Array;
		private var _applicationDomain:ApplicationDomain;

		public function MarshalData(klass:Class,applicationDomain:ApplicationDomain)
		{
			var type:Type = Type.forClass(klass);
			_class = klass;
			_applicationDomain = applicationDomain;
			extractRootNodeName(type);
			extractAttributes(type);
			extractElements(type);
			extractElementsLists(type);
		}

		private function extractRootNodeName(type:Type):void
		{
			for each (var metadata:MetaData in type.metaData)
			{
				if (metadata.name==XML_ROOT_NODE)
				{
					_rootNodeName = metadata.getArgument('name').value;
				}
			}		
		}
		
		private function extractAttributes(type:Type):void
		{
			_attributes = [];
			appendMembersWithMetadata(_attributes,type.accessors,XML_ATTRIBUTE)
			appendMembersWithMetadata(_attributes,type.variables,XML_ATTRIBUTE)
		}
		
		private function extractElements(type:Type):void
		{
			_elements = [];
			appendMembersWithMetadata(_elements,type.accessors,XML_ELEMENT)
			appendMembersWithMetadata(_elements,type.variables,XML_ELEMENT)
		}
		
		private function extractElementsLists(type:Type):void
		{
			_elementsLists = [];
			appendMembersWithMetadata(_elementsLists,type.accessors,XML_ELEMENTS)
			appendMembersWithMetadata(_elementsLists,type.variables,XML_ELEMENTS)
		}
		
		private function appendMembersWithMetadata(filteredMembers:Array,newMembers:Array,metadataName:String):void
		{
			for each (var member:AbstractMember in newMembers)
			{ 
				for each (var metadata:MetaData in member.metaData)
				{
					if (metadata.name == metadataName)
					{
						filteredMembers.push(createXMLDataFromMember(metadata,member));
					}
				}
			}				
		}
		
		private function createXMLDataFromMember(metadata:MetaData,member:AbstractMember):XMLData
		{			
			var data:XMLData = new XMLData();
			data.name = metadata.getArgument('name').value;
			data.accessorName = member.name;
			data.type = member.type.clazz;
			if (metadata.getArgument('type'))
			{
				data.listClass = getDefinition(metadata.getArgument('type').value);
			}
			if (metadata.getArgument('CDATA'))
			{
				data.isCDATA = metadata.getArgument('CDATA').value == "true";
			}
			if (member.hasMetaData(XML_ELEMENT_WRAPPER))
			{
				var wrapper:MetaData = member.getMetaData(XML_ELEMENT_WRAPPER)[0];
				data.wrapperNodeName = wrapper.getArgument('name').value;
			}
			if (member.hasMetaData(XML_AS_TYPE_ADAPTER))
			{
				var adapterData:MetaData = member.getMetaData(XML_AS_TYPE_ADAPTER)[0];
				var adapterClass:Class = getDefinition(adapterData.getArgument('type').value);
				data.adapter = XMLAdapter(new adapterClass());
			}
			return data;
		}
		
		private function getDefinition(className:String):Class
		{
			var klass:Class;
			if (_applicationDomain==null)
			{
				klass = getDefinitionByName(className) as Class;
			}
			else
			{
				klass = _applicationDomain.getDefinition(className) as Class;				
			}
			return klass;
		}

		public function get rootNodeName():String
		{
			return _rootNodeName;
		}

		public function get attributes():Array
		{
			return _attributes;
		}

		public function get elements():Array
		{
			return _elements;
		}

		public function get elementsLists():Array
		{
			return _elementsLists;
		}
		
		public function get klass():Class
		{
			return _class;
		}

		public function get applicationDomain():ApplicationDomain
		{
			return _applicationDomain;
		}


	}
}