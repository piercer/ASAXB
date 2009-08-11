package asaxb.xml.bind
{

	import asaxb.xml.helpers.MarshalData;
	
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	public class ASAXBContext
	{

		private static var _instances:Dictionary = new Dictionary();

		private var _marshalData:MarshalData;
		private var _marshaller:Marshaller;
		private var _unmarshaller:Unmarshaller;

		public function ASAXBContext(klass:Class, applicationDomain:ApplicationDomain=null)
		{
			_marshalData = new MarshalData(klass,applicationDomain);
		}
		
		public static function newInstance( klass:Class, applicationDomain:ApplicationDomain=null ):ASAXBContext
		{
			var className:String = getQualifiedClassName(klass);
			var instance:ASAXBContext = _instances[className];
			if (!instance)
			{
				instance = new ASAXBContext(klass, applicationDomain);
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