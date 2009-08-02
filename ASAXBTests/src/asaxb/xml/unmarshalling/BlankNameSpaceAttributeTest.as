package asaxb.xml.unmarshalling
{
	import asaxb.objects.BasicAttributeTestObject;
	import asaxb.xml.bind.ASAXBContext;
	import asaxb.xml.bind.Unmarshaller;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class BlankNameSpaceAttributeTest
	{
		
		[Test]
		public function testUnmarshallBasicAttributeObjectWithBlankNameSpace():void
		{
			var xml:XML = <basic-attribute-test xmlns="blank_namespace" basic-attribute="A basic attribute"/>;
			var result:BasicAttributeTestObject = unmarshal(BasicAttributeTestObject,xml);
			assertThat(result.basicAttribute,equalTo("A basic attribute"));
		}
		
		private function unmarshal(klass:Class,xml:XML):BasicAttributeTestObject
		{
			var context:ASAXBContext = ASAXBContext.newInstance(klass);
			var unmarshaller:Unmarshaller = context.createUnmarshaller();
			return unmarshaller.unmarshal(xml);
		}
		
	}
	
}
