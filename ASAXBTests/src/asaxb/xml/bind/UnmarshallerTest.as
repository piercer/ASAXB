package asaxb.xml.bind
{
	
	import asaxb.test.OuterObject;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;

	public class UnmarshallerTest
	{
		
		private var _unmarshaller:Unmarshaller;
		private var _object:OuterObject;
		
		private const _xml:XML = <outer-object level="3" outer="false">
									<test-element>This is an element</test-element>
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
			assertThat(_object.attribute1,equalTo(3));
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

	}
}