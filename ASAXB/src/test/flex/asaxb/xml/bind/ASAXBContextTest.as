package asaxb.xml.bind
{
	
	import asaxb.test.OuterObject;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class ASAXBContextTest
	{
		
		public function ASAXBContextTest()
		{
		}

 		[Test]
		public function testContextsAreCached():void
		{
			var context1:ASAXBContext = ASAXBContext.newInstance(OuterObject);
			var context2:ASAXBContext = ASAXBContext.newInstance(OuterObject);
			assertThat(context1,equalTo(context2));
		}

 		[Test]
		public function testMarshallersAreCached():void
		{
			var context:ASAXBContext = ASAXBContext.newInstance(OuterObject);
			var marshaller1:Marshaller = context.createMarshaller();
			var marshaller2:Marshaller = context.createMarshaller();
			assertThat(marshaller1,equalTo(marshaller2));
		}

 		[Test]
		public function testUnmarshallersAreCached():void
		{
			var context:ASAXBContext = ASAXBContext.newInstance(OuterObject);
			var unmarshaller1:Unmarshaller = context.createUnmarshaller();
			var unmarshaller2:Unmarshaller = context.createUnmarshaller();
			assertThat(unmarshaller1,equalTo(unmarshaller2));
		}

	}

}