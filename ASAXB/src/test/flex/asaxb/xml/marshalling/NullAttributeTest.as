package asaxb.xml.marshalling
{
	import asaxb.objects.NullAttributeTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Marshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class NullAttributeTest
	{		
		[Test]
		public function testMarshallNullAttribute():void
		{
			var result:XML = marshal(NullAttributeTestObject);
			assertThat(result.toXMLString(),equalTo(NullAttributeTestObject.expectedXML.toXMLString()));
		}
		
		private function marshal(klass:Class):XML
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var marshaller:Marshaller = context.createMarshaller();
			return marshaller.marshal(new klass());
		}

	}
}