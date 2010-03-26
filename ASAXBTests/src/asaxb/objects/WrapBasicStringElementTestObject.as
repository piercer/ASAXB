package asaxb.objects
{

	[XmlRootNode(name="wrapped-basic-string-element-test")]
	public class WrapBasicStringElementTestObject
	{
		
		public static const expectedXML:XML = <wrapped-basic-string-element-test>
												<test-wrapper>
							  						<basic-string-element>A wrapped basic String element</basic-string-element>
							  					</test-wrapper>
							  		 		  </wrapped-basic-string-element-test>;
		
		[XmlElementWrapper(name="test-wrapper")]
		[XmlElement(name="basic-string-element")]
		public function get basicStringElement():String
		{
			return 'A wrapped basic String element';
		}		

	}

}