package asaxb.xml.annotationtests
{
	import asaxb.objects.BasicAttributeTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Marshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class XmlAttributeTest
	{
	
		[Test]
		public function testBasicAttribute():void
		{
			var result:XML = marshal(BasicAttributeTestObject);
			assertThat(result.toXMLString(),equalTo(BasicAttributeTestObject.expectedXML.toXMLString()));
		}
				
		private function marshal(klass:Class):XML
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var marshaller:Marshaller = context.createMarshaller();
			return marshaller.marshal(new klass());
		}
	
	}

}
