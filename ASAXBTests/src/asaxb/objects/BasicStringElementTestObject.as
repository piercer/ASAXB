package asaxb.objects
{

	[XmlRootNode(name='basic-string-element-test')]
	public class BasicStringElementTestObject
	{
		
		public static const expectedXML:XML = <basic-string-element-test>
							  					<basic-string-element>A basic String element</basic-string-element>
							  		 		  </basic-string-element-test>;
		
		private var _basicStringElement:String;
		
		public function BasicStringElementTestObject()
		{
			_basicStringElement = 'A basic String element';
		}
		
		[XmlElement(name='basic-string-element')]
		public function get basicStringElement():String
		{
			return _basicStringElement;
		}		

		public function set basicStringElement(value:String):void
		{
			_basicStringElement = value;
		}		

	}

}