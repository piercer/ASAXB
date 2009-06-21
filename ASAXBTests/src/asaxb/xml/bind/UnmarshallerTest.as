package asaxb.xml.bind
{
	
	import asaxb.test.InnerInnerObject;
	import asaxb.test.InnerObject;
	import asaxb.test.OuterObject;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;

	public class UnmarshallerTest
	{
		
		private var _unmarshaller:Unmarshaller;
		private var _object:OuterObject;
		
		private const _xml:XML = <outer-object xmlns:testns="http://zoltanb.co.uk/" level="1" outer="false" var1="Variable from XML">
									<test-element>This is an element</test-element>
									<var2>false</var2>
									<testns:var3>namespace variable from xml</testns:var3>
									<inner-object level="2" testns:var4="namespace attribute from xml">
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
			_unmarshaller = context.createUnmarshaller();
			_object = _unmarshaller.unmarshal(_xml);
		}
		
		[Test]
		public function testObjectisNotNull():void
		{
			assertThat(_object,notNullValue());
		}
		
		[Test]
		public function testAttribute1isCorrect():void
		{			
			assertThat(_object.attribute1,equalTo(1));
		}

		[Test]
		public function testAttribute2isCorrect():void
		{			
			assertThat(_object.attribute2,equalTo(false));
		}

		[Test]
		public function testElementisCorrect():void
		{			
			assertThat(_object.element,equalTo("This is an element"));
		}

		[Test]
		public function testVariable1IsCorrect():void
		{			
			assertThat(_object.variable1,equalTo("Variable from XML"));
		}

		[Test]
		public function testVariable2IsCorrect():void
		{
			assertThat(_object.variable2,equalTo(false));
		}
		
		[Test]
		public function testInnerObjectsIsRightLength():void
		{
			assertThat(_object.innerObjects.length,equalTo(2));			
		}

		[Test]
		public function testInnerObject0IsCorrect():void
		{
			var innerObject:InnerObject = _object.innerObjects[0];
			assertThat(innerObject.elements.length,equalTo(0));			
		}

		[Test]
		public function testInnerObject1IsCorrect():void
		{
			var innerObject:InnerObject = _object.innerObjects[1];
			assertThat(innerObject.elements.length,equalTo(1));
			var innerInnerObject:InnerInnerObject = innerObject.elements[0];
			assertThat(innerInnerObject.attribute1,equalTo(3));	
			assertThat(innerInnerObject.element1,equalTo("I'm inside at level 3"));	
		}
		
		[Test]
		public function testNamespaceElement():void
		{
			assertThat(_object.variable3,equalTo("namespace variable from xml"));
		}
		
		[Test]
		public function testNamespaceAttribute():void
		{
			var innerObject:InnerObject = _object.innerObjects[0];
			assertThat(innerObject.variable4,equalTo("namespace attribute from xml"));
		}

	}
}