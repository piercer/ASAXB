package asaxb.xml.helpers
{
		
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class XMLDataTest
	{
		
		private const dataName:String = 'test-attribute';
		private const dataAccessorName:String = 'test-attribute-accessor';
		private const dataType:Class = Boolean;

		private var _data:XMLData;
				
		[Before]
		public function setUp():void
		{
			_data = new XMLData();
			_data.name = dataName;
			_data.accessorName = dataAccessorName;
			_data.type = dataType;
		}
		
		[Test]
		public function testName():void
		{
			assertThat(_data.name,equalTo(dataName));
		}

		[Test]
		public function testAccessorName():void
		{
			assertThat(_data.accessorName,equalTo(dataAccessorName));
		}

		[Test]
		public function testype():void
		{
			assertThat(_data.type,equalTo(dataType));
		}

	}

}