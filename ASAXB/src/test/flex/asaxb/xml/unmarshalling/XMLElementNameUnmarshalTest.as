package asaxb.xml.unmarshalling
{
	import asaxb.objects.DateElementTestObject;
	import asaxb.objects.XMLElementNameTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Unmarshaller;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.object.equalTo;

	public class XMLElementNameUnmarshalTest
	{
		
		[Test]
		public function testUnmarshallElementNames():void
		{
			var result:XMLElementNameTestObject = unmarshal(XMLElementNameTestObject,XMLElementNameTestObject.xml);
			assertThat(result.item1.quantity,equalTo(1));
			assertThat(result.item2.quantity,equalTo(2));
		}
		
		private function unmarshal(klass:Class,xml:XML):XMLElementNameTestObject
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var unmarshaller:Unmarshaller = context.createUnmarshaller();
			return unmarshaller.unmarshal(xml);
		}
		
		
	}
}