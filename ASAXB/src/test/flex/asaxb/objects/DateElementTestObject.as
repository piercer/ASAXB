package asaxb.objects
{
	
	[XmlRootNode(name="date-element-test")]
	public class DateElementTestObject
	{
		
		public static const xml:XML = <date-element-test>
          								<date>Wed Apr 12 15:30:17 GMT-0700 2006</date>
									  </date-element-test>;
		
		[XmlElement(name="date")]
		public var date:Date;

	}
}