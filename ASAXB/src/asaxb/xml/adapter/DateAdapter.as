package asaxb.xml.adapter
{
	import mx.formatters.DateFormatter;

	public class DateAdapter implements XMLAdapter
	{
		
		private var _formatter:DateFormatter

		public function DateAdapter()
		{
		}
		
		public function marshal(value:*):*
		{
			return value;
		}
		
		public function unmarshal(value:*):*
		{
			return new Date(Date.parse(value));
		}

	}

}