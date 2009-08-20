package asaxb.xml.annotationtests
{
	import asaxb.objects.DoubleXmlElementTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Unmarshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class DoubleXmlElementTest
	{
		public function DoubleXmlElementTest()
		{
		}
		
		[Test]
		public function testDoubleElementFirstAnnotationUnmarshal():void
		{
			var result:DoubleXmlElementTestObject = unmarshal(DoubleXmlElementTestObject.xml1,DoubleXmlElementTestObject);
			assertThat(result.element,equalTo("element 1"));
		}

		[Test]
		public function testDoubleElementSecondAnnotationUnmarshal():void
		{
			var result:DoubleXmlElementTestObject = unmarshal(DoubleXmlElementTestObject.xml2,DoubleXmlElementTestObject);
			assertThat(result.element,equalTo("element 2"));
		}
		
		private function unmarshal(xml:XML,klass:Class):DoubleXmlElementTestObject
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var unmarshaller:Unmarshaller = context.createUnmarshaller();
			return unmarshaller.unmarshal(xml);
		}

	}
}