package asaxb.test
{
	
	import asaxb.xml.helpers.AttributeTest;
	import asaxb.xml.helpers.ElementTest;
	import asaxb.xml.helpers.MarshalDataTest;
	import asaxb.xml.bind.UnmarshallerTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AllTests
	{
		public var t1:UnmarshallerTest;
		public var t2:MarshalDataTest;
		public var t3:AttributeTest;
		public var t4:ElementTest;
	}

}