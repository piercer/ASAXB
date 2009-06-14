package asaxb.xml.bind
{

	import asaxb.test.InnerInnerObject;
	import asaxb.test.InnerObject;
	import asaxb.test.OuterObject;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class MarshallerTest
	{
		
		private var _xml:XML;
		
		private const _expectedXml:XML = <outer-object outer="true" level="1" var1="Variable attribute">
											<test-element>This is a test element</test-element>
											<inner-object level="2">
												<element>I'm inside at level 2</element>
											</inner-object>
											<inner-object level="2">
												<element>I'm inside at level 2</element>
												<inner-inner-object level="3">
													<element>I'm inside at level 3</element>
												</inner-inner-object>
											</inner-object>
									   </outer-object>;

		[Before]
		public function setUp():void
		{
			var context:ASAXBContext = ASAXBContext.newInstance(OuterObject);
			var marshaller:Marshaller = context.createMarshaller();
			var outerObject:OuterObject = new OuterObject();
			var innerObject1:InnerObject = new InnerObject(2);
			var innerObject2:InnerObject = new InnerObject(2);
			var innerInnerObject:InnerInnerObject = new InnerInnerObject(3);
			outerObject.element = "This is a test element";
			outerObject.variable1 = "Variable attribute";
			innerObject2.addInnerObject(innerInnerObject);
			outerObject.addInnerObject(innerObject1);
			outerObject.addInnerObject(innerObject2);
			_xml = marshaller.marshal(outerObject);
		}
		
		[Test]
		public function testMarshal():void
		{
			assertThat(_xml.toXMLString(),equalTo(_expectedXml.toXMLString()));
		}

	}

}