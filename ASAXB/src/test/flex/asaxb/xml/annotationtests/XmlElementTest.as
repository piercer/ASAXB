package asaxb.xml.annotationtests
{
	
	import asaxb.objects.BasicStringElementTestObject;
	import asaxb.objects.CDATAStringElementTestObject;
	import asaxb.objects.WrapBasicStringElementTestObject;
	import asaxb.objects.WrapCDATAStringElementTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Marshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class XmlElementTest
	{
	
		[Test]
		public function testBasicStringElement():void
		{
			var result:XML = marshal(BasicStringElementTestObject);
			assertThat(result.toXMLString(),equalTo(BasicStringElementTestObject.expectedXML.toXMLString()));
		}
		
		[Test]
		public function testCDATAStringElement():void
		{
			var result:XML = marshal(CDATAStringElementTestObject);
			assertThat(result.toXMLString(),equalTo(CDATAStringElementTestObject.expectedXML.toXMLString()));
		}

		[Test]
		public function testWrapBasicStringElement():void
		{
			var result:XML = marshal(WrapBasicStringElementTestObject);
			assertThat(result.toXMLString(),equalTo(WrapBasicStringElementTestObject.expectedXML.toXMLString()));
		}

		[Test]
		public function testWrapCDATAStringElement():void
		{
			var result:XML = marshal(WrapCDATAStringElementTestObject);
			assertThat(result.toXMLString(),equalTo(WrapCDATAStringElementTestObject.expectedXML.toXMLString()));
		}
		
		private function marshal(klass:Class):XML
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var marshaller:Marshaller = context.createMarshaller();
			return marshaller.marshal(new klass());
		}
	
	}

}
