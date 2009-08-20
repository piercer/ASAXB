package asaxb.test
{
	
	import asaxb.xml.annotationtests.DoubleXmlElementTest;
	import asaxb.xml.annotationtests.XmlAttributeTest;
	import asaxb.xml.annotationtests.XmlElementTest;
	import asaxb.xml.bind.ASAXBContextTest;
	import asaxb.xml.bind.MarshallerTest;
	import asaxb.xml.bind.UnmarshallerTest;
	import asaxb.xml.helpers.MarshalDataTest;
	import asaxb.xml.helpers.XMLDataTest;
	import asaxb.xml.unmarshalling.ArrayOfStringsTest;
	import asaxb.xml.unmarshalling.BlankAttributeTest;
	import asaxb.xml.unmarshalling.BlankNameSpaceAttributeTest;
	import asaxb.xml.unmarshalling.BlankNameSpaceElementTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AllTests
	{
		public var t1:UnmarshallerTest;
		public var t2:MarshallerTest;
		public var t3:MarshalDataTest;
		public var t4:XMLDataTest;
		public var t5:ASAXBContextTest;
		
		public var t6:XmlElementTest;
		public var t7:XmlAttributeTest;
		
		public var t8:BlankNameSpaceAttributeTest;
		public var t9:BlankNameSpaceElementTest;
		
		public var t10:DoubleXmlElementTest;
		public var t11:BlankAttributeTest;
		public var t12:ArrayOfStringsTest;
		
	}

}