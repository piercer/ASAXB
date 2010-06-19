package asaxb.objects
{

	[XmlRootNode(name="null-attribute-test")]
	public class NullAttributeTestObject
	{
		
		public static const expectedXML:XML = <null-attribute-test null-attribute=""/>;
		
		private var _nullAttribute:String;
		
		[XmlAttribute(name="null-attribute")]
		public function get nullAttribute():String
		{
			return _nullAttribute;
		}		

		public function set nullAttribute(value:String):void
		{
			_nullAttribute = value;
		}		

	}

}