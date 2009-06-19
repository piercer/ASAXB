package asaxb.xml.helpers
{
		
	import asaxb.xml.adapter.XMLAdapter;
	
	import flash.utils.getDefinitionByName;
	
	import org.as3commons.reflect.AbstractMember;
	import org.as3commons.reflect.MetaData;
	import org.as3commons.reflect.Type;

	public class MarshalData
	{
		
		private var _class:Class;
		private var _rootNodeName:String;
		private var _attributes:Array;
		private var _elements:Array;
		private var _elementsLists:Array;

		public function MarshalData(klass:Class)
		{
			var type:Type = Type.forClass(klass);
			_class = klass;
			extractRootNodeName(type);
			extractAttributes(type);
			extractElements(type);
			extractElementsLists(type);
		}

		private function extractRootNodeName(type:Type):void
		{
			for each (var metadata:MetaData in type.metaData)
			{
				if (metadata.name=="XmlRootNode")
				{
					_rootNodeName = metadata.getArgument('name').value;
				}
			}		
		}
		
		private function extractAttributes(type:Type):void
		{
			_attributes = [];
			appendMembersWithMetadata(_attributes,type.accessors,"XmlAttribute")
			appendMembersWithMetadata(_attributes,type.variables,"XmlAttribute")
		}
		
		private function extractElements(type:Type):void
		{
			_elements = [];
			appendMembersWithMetadata(_elements,type.accessors,"XmlElement")
			appendMembersWithMetadata(_elements,type.variables,"XmlElement")
		}
		
		private function extractElementsLists(type:Type):void
		{
			_elementsLists = [];
			appendMembersWithMetadata(_elementsLists,type.accessors,"XmlElements")
			appendMembersWithMetadata(_elementsLists,type.variables,"XmlElements")
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
				data.listClass = getDefinitionByName(metadata.getArgument('type').value) as Class;
			}
			if (member.hasMetaData("XmlElementWrapper"))
			{
				var wrapper:MetaData = member.getMetaData("XmlElementWrapper")[0];
				data.wrapperNodeName = wrapper.getArgument('name').value;
			}
			if (member.hasMetaData("XmlFlashTypeAdapter"))
			{
				var adapterData:MetaData = member.getMetaData("XmlFlashTypeAdapter")[0];
				var adapterClass:Class = getDefinitionByName(adapterData.getArgument('type').value) as Class;
				data.adapter = XMLAdapter(new adapterClass());
			}
			return data;
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

	}
}