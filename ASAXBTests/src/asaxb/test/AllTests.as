package asaxb.test
{
	import asaxb.helpers.MarshalDataTest;
	import asaxb.xml.bind.UnmarshallerTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AllTests
	{
		public var t1:UnmarshallerTest;
		public var t2:MarshalDataTest;
	}

}