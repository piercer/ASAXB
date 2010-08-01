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
		
		private const _expectedXml:XML = <outer-object xmlns:testns="http://zoltanb.co.uk/" testns:var4="namespace attribute from xml" outer="true" level="1" var1="Variable attribute">
											<test-element>This is a test element</test-element>
											<var2>true</var2>
											<testns:var3>namespace variable from xml</testns:var3>
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
			var innerObject1:InnerObject = new InnerObject();
			var innerObject2:InnerObject = new InnerObject();
			var innerInnerObject:InnerInnerObject = new InnerInnerObject();
			innerObject1.attribute1 = 2;
			innerObject2.attribute1 = 2;
			innerInnerObject.attribute1 = 3;
			outerObject.element = "This is a test element";
			outerObject.variable1 = "Variable attribute";
			outerObject.variable2 = true;
			innerObject2.addInnerObject(innerInnerObject);
			outerObject.addInnerObject(innerObject1);
			outerObject.addInnerObject(innerObject2);
			_xml = marshaller.marshal(outerObject);
		}
		
		[Test]
		public function testRootNode():void
		{
			assertThat(_xml.localName(),equalTo(_expectedXml.localName()));
		}

		[Test]
		public function testRootVar1Parameter():void
		{
			testParameterEquality("var1");
		}

		[Test]
		public function testRootOuterParameter():void
		{
			testParameterEquality("outer");
		}

		[Test]
		public function testRootLevelParameter():void
		{
			testParameterEquality("level");
		}
		
		[Test]
		public function testAccessorElement():void
		{
			testElementEquality("test-element");
		}

		[Test]
		public function testVariableElement():void
		{
			testElementEquality("var2");
		}
		
		[Test]
		public function testInnerObjectsIsRightLength():void
		{
			var nActual:int = _xml['inner-object'].length;
			var nExpected:int = _expectedXml['inner-object'].length;
			assertThat(nActual,equalTo(nExpected));
		}
		
		private function testParameterEquality(parameterName:String):void
		{
			var actual:String = _xml.@[parameterName];
			var expected:String = _expectedXml.@[parameterName];
			assertThat(actual,equalTo(expected));
		}

		private function testElementEquality(elementName:String):void
		{
			var actual:String = _xml[elementName];
			var expected:String = _expectedXml[elementName];
			assertThat(actual,equalTo(expected));
		}

	}

}