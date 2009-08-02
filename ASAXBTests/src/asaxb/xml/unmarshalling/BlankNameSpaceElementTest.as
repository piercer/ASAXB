package asaxb.xml.unmarshalling
{
	import asaxb.objects.BasicStringElementTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Unmarshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class BlankNameSpaceElementTest
	{
		
		[Test]
		public function testUnmarshallBasicStringElementObjectWithBlankNameSpace():void
		{
			var xml:XML = <basic-string-element-test xmlns="blank_namespace">
							<basic-string-element>A basic String element</basic-string-element>
						  </basic-string-element-test>;
			var result:BasicStringElementTestObject = unmarshal(BasicStringElementTestObject,xml);
			assertThat(result.basicStringElement,equalTo("A basic String element"));
		}
		
		private function unmarshal(klass:Class,xml:XML):BasicStringElementTestObject
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var unmarshaller:Unmarshaller = context.createUnmarshaller();
			return unmarshaller.unmarshal(xml);
		}
		
	}
	
}
