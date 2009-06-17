package asaxb.xml.helpers
{
		
	import asaxb.test.InnerObject;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class XMLDataTest
	{
		
		private const _dataName:String = 'test-attribute';
		private const _dataAccessorName:String = 'test-attribute-accessor';
		private const _dataWrapperNodeName:String = 'test-wrapper-node';
		private const _dataType:Class = Boolean;
		private const _listClass:Class = InnerObject;

		private var _data:XMLData;
				
		[Before]
		public function setUp():void
		{
			_data = new XMLData();
			_data.name = _dataName;
			_data.accessorName = _dataAccessorName;
			_data.type = _dataType;
			_data.listClass = _listClass;
			_data.wrapperNodeName = _dataWrapperNodeName;
		}
		
		[Test]
		public function testName():void
		{
			assertThat(_data.name,equalTo(_dataName));
		}

		[Test]
		public function testAccessorName():void
		{
			assertThat(_data.accessorName,equalTo(_dataAccessorName));
		}

		[Test]
		public function testType():void
		{
			assertThat(_data.type,equalTo(_dataType));
		}

		[Test]
		public function testListClass():void
		{
			assertThat(_data.listClass,equalTo(_listClass));
		}

		[Test]
		public function testWrapperNodeName():void
		{
			assertThat(_data.wrapperNodeName,equalTo(_dataWrapperNodeName));
		}

	}

}