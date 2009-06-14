package asaxb.xml.helpers
{
		
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class AttributeTest
	{
		
		private const attributeName:String = 'test-attribute';
		private const attributeAccessorName:String = 'test-attribute-accessor';
		private const attributeType:Class = Boolean;

		private var _attribute:Attribute;
				
		[Before]
		public function setUp():void
		{
			_attribute = new Attribute();
			_attribute.name = attributeName;
			_attribute.accessorName = attributeAccessorName;
			_attribute.type = attributeType;
		}
		
		[Test]
		public function testName():void
		{
			assertThat(_attribute.name,equalTo(attributeName));
		}

		[Test]
		public function testAccessorName():void
		{
			assertThat(_attribute.accessorName,equalTo(attributeAccessorName));
		}

		[Test]
		public function testype():void
		{
			assertThat(_attribute.type,equalTo(attributeType));
		}

	}

}