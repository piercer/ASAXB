package asaxb.xml.helpers
{
	
	import org.as3commons.reflect.Accessor;
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
			for each (var accessor:Accessor in type.accessors)
			{ 
				for each (var metadata:MetaData in accessor.metaData)
				{
					if (metadata.name == "XmlAttribute")
					{
						var attribute:Attribute = new Attribute();
						attribute.name = metadata.getArgument('name').value;
						attribute.accessorName = accessor.name;
						attribute.type = accessor.type.clazz;
						_attributes.push(attribute);
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
						var element:Element = new Element();
						element.name = metadata.getArgument('name').value;
						element.accessorName = accessor.name;
						element.type = accessor.type.clazz;
						_elements.push(element);
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
						var element:Element = new Element();
						element.name = metadata.getArgument('name').value;
						element.accessorName = accessor.name;
						_elementsLists.push(element);
					}
				}
			}
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