package asaxb.objects
{

	[XmlRootNode(name="null-element-test")]
	public class NullElementTestObject
	{
		
		public static const expectedXML:XML = <null-element-test>
							  					<null-element></null-element>
							  		 		  </null-element-test>;
		
		private var _nullElement:String;
		
		public function NullElementTestObject()
		{
		}
		
		[XmlElement(name="null-element")]
		public function get nullElement():String
		{
			return _nullElement;
		}		

		public function set nullElement(value:String):void
		{
			_nullElement = value;
		}		

	}

}