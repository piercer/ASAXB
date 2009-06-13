package asaxb.xml.bind
{

	import asaxb.xml.helpers.Attribute;
	import asaxb.xml.helpers.Element;
	import asaxb.xml.helpers.MarshalData;

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
			
			for each (var attribute:Attribute in _marshalData.attributes)
			{
				object[attribute.accessorName] = getValueFromString(xml.@[attribute.name],attribute.type);
			}

			for each (var element:Element in _marshalData.elements)
			{
				object[element.accessorName] = getValueFromString(xml[element.name],element.type);
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
				
				case int:
					result = int(value);
					break
				
				case String:
					result = value;
					break;
					
			}
			return result;
		}

	}

}