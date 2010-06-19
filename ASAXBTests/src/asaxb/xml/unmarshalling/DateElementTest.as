package asaxb.xml.unmarshalling
{
	import asaxb.objects.DateElementTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Unmarshaller;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.object.equalTo;

	public class DateElementTest
	{
		
		[Test]
		public function testUnmarshallDateElement():void
		{
			var result:DateElementTestObject = unmarshal(DateElementTestObject,DateElementTestObject.xml);
			assertTrue(result.date is Date);
			assertTrue(result.date.hours,equalTo(15));
			assertTrue(result.date.minutes,equalTo(30));
			assertTrue(result.date.seconds,equalTo(17));
		}
		
		private function unmarshal(klass:Class,xml:XML):DateElementTestObject
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var unmarshaller:Unmarshaller = context.createUnmarshaller();
			return unmarshaller.unmarshal(xml);
		}
		
		
	}
}