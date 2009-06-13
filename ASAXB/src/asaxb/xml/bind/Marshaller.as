package asaxb.xml.bind
{
	
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;
	
	import asaxb.xml.helpers.Attribute;
	import asaxb.xml.helpers.Element;
	import asaxb.xml.helpers.MarshalData;

	public class Marshaller
	{
		
		private var _marshalData:MarshalData;

		public function Marshaller(marshalData:MarshalData)
		{
			_marshalData = marshalData; 
		}
				
		public function marshall(object:*):XML
		{
			
			var name:String;
			var element:Element;

			var root:XML = <{_marshalData.rootNodeName}/>;
			
			for each (var attribute:Attribute in _marshalData.attributes)
			{
				root.@[attribute.name]=object[attribute.accessorName];
			}

			for each (element in _marshalData.elements)
			{
				var elementNode:XMLNode = new XMLNode(XMLNodeType.ELEMENT_NODE,element.name);
				var elementValueNode:XMLNode = new XMLNode(XMLNodeType.TEXT_NODE,object[element.accessorName]);
				elementNode.appendChild(elementValueNode);
				root.appendChild(elementNode);
			}
			
			for each (element in _marshalData.elementsLists)
			{
				var elements:Array = object[element.accessorName];
				for each (var innerElement:* in elements)
				{
					var innerClass:Class = Class(getDefinitionByName(getQualifiedClassName(innerElement)));
					var context:ASAXBContext = ASAXBContext.newInstance(innerClass);
					var marshaller:Marshaller = context.createMarshaller();
					var elementXML:XML = marshaller.marshall(innerElement);
					root.appendChild(elementXML);
				}
			}			

			return root;
		}

	}

}