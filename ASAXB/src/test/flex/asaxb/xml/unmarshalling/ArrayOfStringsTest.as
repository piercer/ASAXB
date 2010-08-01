package asaxb.xml.unmarshalling
{
	import asaxb.objects.ArrayOfStringsTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Unmarshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class ArrayOfStringsTest
	{
		
		[Test]
		public function testUnmarshallArrayOfStrings():void
		{
			var result:ArrayOfStringsTestObject = unmarshal(ArrayOfStringsTestObject,ArrayOfStringsTestObject.xml);
			assertThat(result.items.length,equalTo(3));
			assertThat(result.items[0],equalTo("This is item one"));
			assertThat(result.items[1],equalTo("This is item two"));
			assertThat(result.items[2],equalTo("This is item three"));
		}
		
		private function unmarshal(klass:Class,xml:XML):ArrayOfStringsTestObject
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var unmarshaller:Unmarshaller = context.createUnmarshaller();
			return unmarshaller.unmarshal(xml);
		}
		
		
	}
}