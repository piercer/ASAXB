package asaxb.xml.unmarshalling
{
	import asaxb.objects.NullElementTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Marshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class NullElementTest
	{		
		[Test]
		public function testUnmarshallNullElement():void
		{
			var result:XML = marshal(NullElementTestObject);
			assertThat(result.toXMLString(),equalTo(NullElementTestObject.expectedXML.toXMLString()));
		}
		
		private function marshal(klass:Class):XML
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var marshaller:Marshaller = context.createMarshaller();
			return marshaller.marshal(new klass());
		}

	}
}