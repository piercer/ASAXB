package asaxb.test
{
	
	import asaxb.xml.bind.MarshallerTest;
	import asaxb.xml.bind.UnmarshallerTest;
	import asaxb.xml.helpers.MarshalDataTest;
	import asaxb.xml.helpers.XMLDataTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AllTests
	{
		public var t1:UnmarshallerTest;
		public var t2:MarshallerTest;
		public var t3:MarshalDataTest;
		public var t4:XMLDataTest;
	}

}