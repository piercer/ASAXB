package asaxb.xml.marshalling
{
	import asaxb.objects.XMLElementNameTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Marshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class XMLElementNameMarshalTest
	{
		[Test]
		public function testMarshallElementName():void
		{
			var result:XML = marshal(XMLElementNameTestObject);
			assertThat(result.toXMLString(),equalTo(XMLElementNameTestObject.xml.toXMLString()));
		}
		
		private function marshal(klass:Class):XML
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var marshaller:Marshaller = context.createMarshaller();
			return marshaller.marshal(new klass());
		}
	}
}