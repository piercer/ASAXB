package asaxb.xml.bind
{

	import asaxb.xml.helpers.MarshalData;
	
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	public class ASAXBContext
	{

		private static var _instances:Dictionary = new Dictionary();

		private var _marshalData:MarshalData;
		private var _marshaller:Marshaller;
		private var _unmarshaller:Unmarshaller;

		public function ASAXBContext(klass:Class)
		{
			_marshalData = new MarshalData(klass);
		}
		
		public static function newInstance( klass:Class ):ASAXBContext
		{
			var className:String = getQualifiedClassName(klass);
			var instance:ASAXBContext = _instances[className];
			if (!instance)
			{
				instance = new ASAXBContext(klass);
				_instances[className] = instance;
			}
			return instance;
		}
		
		public function createMarshaller():Marshaller
		{
			if (!_marshaller)
			{
				_marshaller = new Marshaller(_marshalData);
			}
			return _marshaller;
		}

		public function createUnmarshaller():Unmarshaller
		{
			if (!_unmarshaller)
			{
				_unmarshaller = new Unmarshaller(_marshalData);
			}
			return _unmarshaller;
		}


	}

}