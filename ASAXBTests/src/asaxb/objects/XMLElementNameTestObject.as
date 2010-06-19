package asaxb.objects
{
	import asaxb.test.Item;

	[XmlRootNode(name="order")]
	public class XMLElementNameTestObject
	{
		
		public static const xml:XML = <order>
										<item2>
											<quantity>2</quantity>
										</item2>
										<item1>
											<quantity>1</quantity>
										</item1>
									  </order>;
		
		[XmlElement(name='item1')]
		public var item1:Item=new Item(1);
		
		[XmlElement(name='item2')]
		public var item2:Item=new Item(2);
		
	}
}