package asaxb.xml.adapter
{
	import com.brooksandrus.utils.ISO8601Util;

	public class DateAdapter implements XMLAdapter
	{
		
		private var _formatter:ISO8601Util;

		public function DateAdapter()
		{
			_formatter = new ISO8601Util();
		}
		
		public function marshal(value:*):*
		{
			return _formatter.formatBasicDateTime(value);
		}
		
		public function unmarshal(value:*):*
		{
			return _formatter.parseDateTimeString(value);
		}

	}

}