package asaxb.xml.adapter
{
	public interface XMLAdapter
	{
		function marshal(value:*):*;
		function unmarshal(value:*):*;
	}
}