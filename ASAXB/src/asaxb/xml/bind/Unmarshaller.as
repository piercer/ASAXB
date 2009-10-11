package asaxb.xml.bind
{

	import asaxb.xml.helpers.MarshalData;
	import asaxb.xml.helpers.XMLData;

	public class Unmarshaller
	{
		
		private var _marshalData:MarshalData;
		
		public function Unmarshaller(marshalData:MarshalData)
		{
			_marshalData = marshalData;
		}
		
		public function unmarshal(xml:XML):*
		{
			var object:* = new _marshalData.klass();
			
			for each (var attribute:XMLData in _marshalData.attributes)
			{
				var stringValuesForThisAttribute:XMLList;
				var attributeNs: Namespace =getNameSpace(attribute.name,xml);
				if (attribute.name.indexOf(':')>0)
				{
					stringValuesForThisAttribute = xml.@attributeNs::[attribute.name.split(':')[1]];
				}
				else
				{
					stringValuesForThisAttribute = xml.@[attribute.name];
				}
				if (stringValuesForThisAttribute!=null&&stringValuesForThisAttribute.length()>0)
				{
					object[attribute.accessorName] = getValueFromString(stringValuesForThisAttribute[0],attribute);
				}
				
			}

			for each (var element:XMLData in _marshalData.elements)
			{
				var elementXML:XMLList = getElementXML(xml,element);
				var elementNs: Namespace =getNameSpace(element.name,xml);
				var elementname:String = (element.name.indexOf(':')>0)? element.name.split(':')[1]:element.name;
				var xmlForThisElement:XMLList = xml.elementNs::[elementname];
				if (xmlForThisElement!=null&&xmlForThisElement.length()>0)
				{
					object[element.accessorName] = getValueFromXMLList(xml.elementNs::[elementname],element);
				}
			}
			
			for each (var elementList:XMLData in _marshalData.elementsLists)
			{
				var i:int;
				var objectXML:XML;
				var innerObject:*;
				var objectsXML:XMLList = getElementXML(xml,elementList);
				var nObjects:int = objectsXML.length();
				var innerObjects:Array = [];
				if (!isPrimitive(elementList.listClass))
				{
					var innerContext:ASAXBContext = ASAXBContext.newInstance(elementList.listClass,_marshalData.applicationDomain);
					var innerUnmarshaller:Unmarshaller = innerContext.createUnmarshaller();
					for (i=0;i<nObjects;i++)
					{
						objectXML = objectsXML[i];
						innerObject = innerUnmarshaller.unmarshal(objectXML);
						innerObjects.push(innerObject);
					}
				}
				else
				{
					for (i=0;i<nObjects;i++)
					{
						objectXML = objectsXML[i];
						innerObject = getPrimitiveTypeFromString(objectXML.children()[0],elementList.listClass);
						innerObjects.push(innerObject);
					}					
				}
				object[elementList.accessorName] = innerObjects;
			}
			
			return object;
		}
		
		private function isPrimitive(klass:Class):Boolean
		{
			return (klass==String||klass==Boolean||klass==uint||klass==int||klass==Number||klass==Date);
		}
		
		private function getElementXML(xml:XML,element:XMLData):XMLList
		{
			var elementXML:XMLList;
			var elementNs: Namespace =getNameSpace(element.name,xml);
			var elementName:String = (element.name.indexOf(':')>0)? element.name.split(':')[1]:element.name;
			
			default xml namespace = elementNs;
			
			if (element.wrapperNodeName)
			{
				elementXML = xml[element.wrapperNodeName][elementName];
			}
			else
			{
				elementXML = xml[elementName];
			}
			
			default xml namespace = new Namespace("");
			return elementXML;	
		}
		
		private function getValueFromXMLList(xmlList:XMLList, element:XMLData):*
		{
			var result:*;
			var innerContext:ASAXBContext = ASAXBContext.newInstance(element.type,_marshalData.applicationDomain);
			var innerUnmarshaller:Unmarshaller = innerContext.createUnmarshaller();
			var InnerMarshalData:MarshalData = innerUnmarshaller.marshalData;
			var rootNode:String = InnerMarshalData.rootNodeName;
			if (xmlList!=null && xmlList.length()>0)
			{
				if (rootNode!=null)
				{
					result = innerUnmarshaller.unmarshal(XML(xmlList[0]));
				}
				else
				{
					result = getValueFromString(xmlList,element)
				}
			}
			return result;
					
		}
		
		private function getValueFromXML(xml:XML, element:XMLData):*
		{
			var result:*;
			var innerContext:ASAXBContext = ASAXBContext.newInstance(element.type,_marshalData.applicationDomain);
			var innerUnmarshaller:Unmarshaller = innerContext.createUnmarshaller();
			var InnerMarshalData:MarshalData = innerUnmarshaller.marshalData;
			var rootNode:String = InnerMarshalData.rootNodeName;
			if (xml!=null)
			{
				if (rootNode!=null)
				{
					result = innerUnmarshaller.unmarshal(xml);
				}
				else
				{
					result = getValueFromString(xml,element)
				}
			}
			return result;
			
		}

		private function getValueFromString(value:String, element:XMLData):*
		{
			var result:*;
			if (element.adapter)
			{
				result = element.adapter.unmarshal(value);
			}
			else
			{
				if (isPrimitive(element.type))
				{
					result = getPrimitiveTypeFromString(value,element.type);
				}
				else
				{
					var innerContext:ASAXBContext = ASAXBContext.newInstance(element.type,_marshalData.applicationDomain);
					var innerUnmarshaller:Unmarshaller = innerContext.createUnmarshaller();
					var InnerMarshalData:MarshalData = innerUnmarshaller.marshalData;
					var rootNode:String = InnerMarshalData.rootNodeName;
					if (rootNode!=null)
					{
						result = innerUnmarshaller.unmarshal(new XML(value));
					}	
				}
			}
			return result;
		}
		
		private function getPrimitiveTypeFromString(value:String,type:Class):*
		{
			var result:*;
			switch (type)
			{
				
				case Boolean:
					result = (value=="true");
					break;
				
				case uint:
					result = uint(value);
					break;
				
				case int:
					result = int(value);
					break
				
				case String:
					result = value;
					break;
				
				case Number:
					result = Number(value);
					break;
				
				case Date:
					result = Date.parse(value);
					break;
			}
			return result;
		}
		
		private function getNameSpace(name:String, xml:XML):Namespace
		{
			var ns: Namespace;
			
			if (name.indexOf(':')>0)
			{
				ns = xml.namespace(name.split(':')[0]);
			}
			else
			{
				ns = xml.namespace();
			}
			return ns;
		}
		
		public function get marshalData():MarshalData
		{
			return _marshalData;
		}

	}

}