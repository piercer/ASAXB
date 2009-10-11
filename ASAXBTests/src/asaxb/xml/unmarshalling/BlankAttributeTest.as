package asaxb.xml.unmarshalling
{
	import asaxb.objects.BasicAttributeTestObject;
	import asaxb.objects.BlankAttributeTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Unmarshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class BlankAttributeTest
	{
		
		[Test]
		public function testUnmarshallWithMissingAttributeDoesNotChangeDefaultValue():void
		{
			var result:BlankAttributeTestObject = unmarshal(BlankAttributeTestObject,BlankAttributeTestObject.xml);
			assertThat(result.blankAttribute,equalTo(BlankAttributeTestObject.DEFAULT_ATTRIBUTE_VALUE));
		}
		
		private function unmarshal(klass:Class,xml:XML):BlankAttributeTestObject
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var unmarshaller:Unmarshaller = context.createUnmarshaller();
			return unmarshaller.unmarshal(xml);
		}
		
	}
	
}
