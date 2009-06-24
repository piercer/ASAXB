package asaxb.objects
{

	[XmlRootNode(name='basic-attribute-test')]
	public class BasicAttributeTestObject
	{
		
		public static const expectedXML:XML = <basic-attribute-test basic-attribute="A basic attribute"/>;
				
		[XmlAttribute(name='basic-attribute')]
		public function get basicAttribute():String
		{
			return 'A basic attribute';
		}		

	}

}