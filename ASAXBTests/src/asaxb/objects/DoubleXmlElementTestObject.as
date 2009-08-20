package asaxb.objects
{
	
	[XmlRootNode(name='double-element-test')]
	public class DoubleXmlElementTestObject
	{
		
		public static const xml1:XML = <double-element-test><element1>element 1</element1></double-element-test>;
		public static const xml2:XML = <double-element-test><element2>element 2</element2></double-element-test>;
		
		[XmlElement(name="element1")]
		[XmlElement(name="element2")]
		public var element:String;
		
	}
	
}
		