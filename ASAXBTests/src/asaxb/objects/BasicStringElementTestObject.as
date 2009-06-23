package asaxb.objects
{

	[XmlRootNode(name='basic-string-element-test')]
	public class BasicStringElementTestObject
	{
		
		public static const expectedXML:XML = <basic-string-element-test>
							  					<basic-string-element>A basic String element</basic-string-element>
							  		 		  </basic-string-element-test>;
				
		[XmlElement(name='basic-string-element')]
		public function get basicStringElement():String
		{
			return 'A basic String element';
		}		

	}

}