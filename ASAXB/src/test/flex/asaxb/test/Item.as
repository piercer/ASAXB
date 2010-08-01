package asaxb.test
{
	
	[XmlRootNode(name="item")]
	public class Item
	{
		
		public function Item(quantity:int=0):void
		{
			this.quantity = quantity;
		}
		
		[XmlElement(name="quantity")]
		public var quantity:int;
	}
}