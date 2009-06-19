package asaxb.xml.bind
{
	
	import asaxb.xml.helpers.MarshalData;
	import asaxb.xml.helpers.XMLData;
	
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;

	public class Marshaller
	{
		
		private var _marshalData:MarshalData;

		public function Marshaller(marshalData:MarshalData)
		{
			_marshalData = marshalData; 
		}
				
		public function marshal(object:*):XML
		{
			
			var name:String;
			var element:XMLData;
			var parentNode:XML;

			var root:XML = <{_marshalData.rootNodeName}/>;
			
			for each (var attribute:XMLData in _marshalData.attributes)
			{
				root.@[attribute.name]=object[attribute.accessorName];
			}

			for each (element in _marshalData.elements)
			{
				parentNode = getParentNodeForElement(root,element);
				var marshalledValue:* = getElementValueFromXML(element,object);
				if (marshalledValue is XML)
				{
					parentNode.appendChild(marshalledValue);
				}
				else
				{
					var elementNode:XMLNode = new XMLNode(XMLNodeType.ELEMENT_NODE,element.name)
					var elementValueNode:XMLNode = new XMLNode(XMLNodeType.TEXT_NODE,marshalledValue);
					elementNode.appendChild(elementValueNode);
					parentNode.appendChild(elementNode);
				}
			}
			
			for each (element in _marshalData.elementsLists)
			{
				parentNode = getParentNodeForElement(root,element);
				var elements:Array = object[element.accessorName];
				for each (var innerElement:* in elements)
				{
					var innerClass:Class = Class(getDefinitionByName(getQualifiedClassName(innerElement)));
					var context:ASAXBContext = ASAXBContext.newInstance(innerClass);
					var marshaller:Marshaller = context.createMarshaller();
					var elementXML:XML = marshaller.marshal(innerElement);
					parentNode.appendChild(elementXML);
				}
			}			

			return root;
		}
		
		private function getParentNodeForElement(root:XML,element:XMLData):XML
		{
			var parentNode:XML = root;
			if (element.wrapperNodeName)
			{
				parentNode = <{element.wrapperNodeName}/>;
				root.appendChild(parentNode);
			}
			return parentNode;
		}
		
		private function getElementValueFromXML(element:XMLData, object:*):*
		{
			var result:*;
			switch (element.type)
			{

				case Boolean:				
				case uint:
				case int:
				case String:					
				case Number:
				case Date:
					result = object[element.accessorName];
					break;
					
				default:
					var innerClass:Class = Class(getDefinitionByName(getQualifiedClassName(element.type)));
					var context:ASAXBContext = ASAXBContext.newInstance(innerClass);
					var marshaller:Marshaller = context.createMarshaller();
					result = marshaller.marshal(object[element.accessorName]);
					break;
			}
			if (element.adapter)
			{
				result = element.adapter.marshal(result);
			}
			return result;
		}


	}

}