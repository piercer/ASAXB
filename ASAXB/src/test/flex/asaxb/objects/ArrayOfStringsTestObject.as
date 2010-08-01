package asaxb.objects
{
	
	[XmlRootNode(name="config")]
	public class ArrayOfStringsTestObject
	{
		
		public static const xml:XML = <config>
     									<items>
          									<item>This is item one</item>
          									<item>This is item two</item>
          									<item>This is item three</item>
     									</items>
									  </config>;
		
		[XmlElementWrapper(name="items")]
		[XmlElements(name="item",type="String")]
		public var items:Array;

	}
}