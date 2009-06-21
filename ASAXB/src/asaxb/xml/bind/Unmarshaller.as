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
				var attributeNs: Namespace =getNameSpace(attribute.name,xml);
				if (attributeNs!=null)
				{
					
					var attributename:String = attribute.name.split(':')[1];
					object[attribute.accessorName] = getValueFromString(xml.@attributeNs::[attributename],attribute);
				}
				else
				{
					object[attribute.accessorName] = getValueFromString(xml.@[attribute.name],attribute);
				}
				
			}

			for each (var element:XMLData in _marshalData.elements)
			{
				var elementXML:XMLList = getElementXML(xml,element);
				var elementNs: Namespace =getNameSpace(element.name,xml);
				if (elementNs!=null)
				{
					var elementname:String = element.name.split(':')[1];
					object[element.accessorName] = getValueFromXML(xml.elementNs::[elementname],element);
				}
				else
				{
						object[element.accessorName] = getValueFromXML(xml[element.name],element);
				}
			}
			
			for each (var elementList:XMLData in _marshalData.elementsLists)
			{
				var objectsXML:XMLList = getElementXML(xml,elementList);
				var nObjects:int = objectsXML.length();
				var innerObjects:Array = [];
				var innerContext:ASAXBContext = ASAXBContext.newInstance(elementList.listClass);
				var innerUnmarshaller:Unmarshaller = innerContext.createUnmarshaller();
				for (var i:int=0;i<nObjects;i++)
				{
					var objectXML:XML = objectsXML[i];
					var innerObject:* = innerUnmarshaller.unmarshal(objectXML);
					innerObjects.push(innerObject);
				}
				object[elementList.accessorName] = innerObjects;
			}
			
			return object;
		}
		
		public function getElementXML(xml:XML,element:XMLData):XMLList
		{
			var elementXML:XMLList;
			if (element.wrapperNodeName)
			{
				elementXML = xml[element.wrapperNodeName][element.name];
			}
			else
			{
				elementXML = xml[element.name];
			}
			return elementXML;	
		}
		
		public function getValueFromXML(xmlList:XMLList, element:XMLData):*
		{
			var result:*;
			var innerContext:ASAXBContext = ASAXBContext.newInstance(element.type);
			var innerUnmarshaller:Unmarshaller = innerContext.createUnmarshaller();
			var InnerMarshalData:MarshalData = innerUnmarshaller.marshalData;
			var rootNode:String = InnerMarshalData.rootNodeName;
			if (rootNode!=null)
			{
				
				result = innerUnmarshaller.unmarshal(XML(xmlList));
			}
			else
			{
				result = getValueFromString(xmlList,element)
			}
			return result;
					
		}
		
		
		public function getValueFromString(value:String, element:XMLData):*
		{
			var result:*;
			if (element.adapter)
			{
				result = element.adapter.unmarshal(value);
			}
			else
			{
				switch (element.type)
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
	
					default:
						var innerContext:ASAXBContext = ASAXBContext.newInstance(element.type);
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
		
		private function getNameSpace(name:String, xml:XML):Namespace
		{
			var ns: Namespace;
			
			if (name.indexOf(':')>0)
			{
				ns=xml.namespace(name.split(':')[0]);
			}
			else
			{
				ns = null;
			}
			return ns;
		}
		
		public function get marshalData():MarshalData
		{
			return _marshalData;
		}

	}

}