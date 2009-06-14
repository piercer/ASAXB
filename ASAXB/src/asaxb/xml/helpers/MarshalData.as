package asaxb.xml.helpers
{
		
	import org.as3commons.reflect.AbstractMember;
	import org.as3commons.reflect.Accessor;
	import org.as3commons.reflect.MetaData;
	import org.as3commons.reflect.Type;
	import org.as3commons.reflect.Variable;

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
			var metadata:MetaData;
			var attribute:XMLData;
			_attributes = [];
			for each (var accessor:Accessor in type.accessors)
			{ 
				for each (metadata in accessor.metaData)
				{
					if (metadata.name == "XmlAttribute")
					{
						_attributes.push(createXMLDataFromMember(metadata.getArgument('name').value,accessor));
					}
				}
			}	
			for each (var variable:Variable in type.variables)
			{
				for each (metadata in variable.metaData)
				{
					if (metadata.name == "XmlAttribute")
					{
						_attributes.push(createXMLDataFromMember(metadata.getArgument('name').value,variable));
					}					
				}
			}		
		}
		
		
		private function extractElements(type:Type):void
		{
			_elements = [];
			for each (var accessor:Accessor in type.accessors)
			{ 
				for each (var metadata:MetaData in accessor.metaData)
				{
					if (metadata.name == "XmlElement")
					{
						_elements.push(createXMLDataFromMember(metadata.getArgument('name').value,accessor));
					}
				}
			}
		}
		
		private function extractElementsLists(type:Type):void
		{
			_elementsLists = [];
			for each (var accessor:Accessor in type.accessors)
			{ 
				for each (var metadata:MetaData in accessor.metaData)
				{
					if (metadata.name == 'XmlElements')
					{
						_elementsLists.push(createXMLDataFromMember(metadata.getArgument('name').value,accessor));
					}
				}
			}
		}
		
		private function createXMLDataFromMember(name:String,member:AbstractMember):XMLData
		{
			var attribute:XMLData = new XMLData();
			attribute.name = name;
			attribute.accessorName = member.name;
			attribute.type = member.type.clazz;
			return attribute;
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