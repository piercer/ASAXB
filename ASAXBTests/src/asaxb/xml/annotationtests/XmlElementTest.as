package asaxb.xml.annotationtests
{
	
	import asaxb.objects.BasicStringElementTestObject;
	import asaxb.objects.CDATAStringElementTestObject;
	import asaxb.objects.WrapperElementTestObject;
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
		public function testWrapperElement():void
		{
			var result:XML = marshal(WrapperElementTestObject);
			assertThat(result.toXMLString(),equalTo(WrapperElementTestObject.expectedXML.toXMLString()));
		}
		
		private function marshal(klass:Class):XML
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var marshaller:Marshaller = context.createMarshaller();
			return marshaller.marshal(new klass());
		}
	
	}

}
