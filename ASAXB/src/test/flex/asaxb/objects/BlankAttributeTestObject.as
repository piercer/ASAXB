package asaxb.objects
{
	
	[XmlRootNode(name="blank-attribute-test")]
	public class BlankAttributeTestObject
	{
		
		public static const xml:XML = <blank-attribute-test/>;
		public static const DEFAULT_ATTRIBUTE_VALUE:String = "defaultAttributeValue";
		
		public var _blankAttribute:String;
		
		public function BlankAttributeTestObject()
		{
			_blankAttribute = DEFAULT_ATTRIBUTE_VALUE;
		}
		
		[XmlAttribute(name='blank-attribute')]
		public function get blankAttribute():String
		{
			return _blankAttribute;
		}		
		
		public function set blankAttribute(value:String):void
		{
			_blankAttribute = value;
		}		
		
	}
	
}