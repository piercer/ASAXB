package asaxb.objects
{

	[XmlRootNode(name='basic-attribute-test')]
	public class BasicAttributeTestObject
	{
		
		public static const expectedXML:XML = <basic-attribute-test basic-attribute="A basic attribute"/>;
		
		public var _basicAttribute:String;
		
		public function BasicAttributeTestObject()
		{
			_basicAttribute = "A basic attribute";
		}
				
		[XmlAttribute(name='basic-attribute')]
		public function get basicAttribute():String
		{
			return _basicAttribute;
		}		

		public function set basicAttribute(value:String):void
		{
			_basicAttribute = value;
		}		

	}

}