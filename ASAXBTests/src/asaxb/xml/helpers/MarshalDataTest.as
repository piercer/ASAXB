package asaxb.xml.helpers
{
	
	import asaxb.test.OuterObject;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class MarshalDataTest
	{

		private var _marshalData:MarshalData;
		private var _attributes:Array;
				
		[Before]
		public function setUp():void
		{
			_marshalData = new MarshalData(OuterObject);
			_attributes = _marshalData.attributes;
		}
		
		[Test]
		public function testRootNodeName():void
		{
			assertThat(_marshalData.rootNodeName,equalTo('outer-object'));
		}
		
		[Test]
		public function testAttributesIsRightLength():void
		{
			assertThat(_attributes.length,equalTo(2));
		}

		[Test]
		public function testAttribute1IsInt():void
		{
			var attribute:Attribute = getAttributeWithAccessorName("attribute1");
			assertThat(attribute.type,equalTo(int));
		}

		[Test]
		public function testAttribute2IsBoolean():void
		{
			var attribute:Attribute = getAttributeWithAccessorName("attribute2");
			assertThat(attribute.type,equalTo(Boolean));
		}

		private function getAttributeWithAccessorName(accessorName:String):Attribute
		{
			var attribute:Attribute;
			for (var i:int=0;i<_attributes.length;i++)
			{
				attribute = _attributes[i];
				if (attribute.accessorName == accessorName)
				{
					break;
				}
			}
			return attribute;
		}

	}

}