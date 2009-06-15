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
				object[attribute.accessorName] = getValueFromString(xml.@[attribute.name],attribute.type);
			}

			for each (var element:XMLData in _marshalData.elements)
			{
				object[element.accessorName] = getValueFromString(xml[element.name],element.type);
			}
			
			for each (var elementList:XMLData in _marshalData.elementsLists)
			{
				var objectsXML:XMLList = xml[elementList.name];
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
		
		public function getValueFromString(value:String, type:Class):*
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
					
			}
			return result;
		}

	}

}