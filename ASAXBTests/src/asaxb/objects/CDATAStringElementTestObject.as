package asaxb.objects
{

	[XmlRootNode(name='basic-string-element-test')]
	public class CDATAStringElementTestObject
	{
		
		public static const expectedXML:XML = <basic-string-element-test>
							  					<cdata-string-element><![CDATA[A cdata String element]]></cdata-string-element>
							  		 		  </basic-string-element-test>;
				
		[XmlElement(name='cdata-string-element',CDATA="true")]
		public function get cdataStringElement():String
		{
			return 'A cdata String element';
		}		

	}

}