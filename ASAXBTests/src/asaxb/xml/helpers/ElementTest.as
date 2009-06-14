package asaxb.xml.helpers
{
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class ElementTest
	{
		
		private const elementName:String = 'test-element';
		private const elementAccessorName:String = 'test-element-accessor';
		private const elementType:Class = Boolean;

		private var _element:Element;
				
		[Before]
		public function setUp():void
		{
			_element = new Element();
			_element.name = elementName;
			_element.accessorName = elementAccessorName;
			_element.type = elementType;
		}
		
		[Test]
		public function testName():void
		{
			assertThat(_element.name,equalTo(elementName));
		}

		[Test]
		public function testAccessorName():void
		{
			assertThat(_element.accessorName,equalTo(elementAccessorName));
		}

		[Test]
		public function testype():void
		{
			assertThat(_element.type,equalTo(elementType));
		}

	}

}