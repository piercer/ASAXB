package asaxb.xml.helpers
{
	public class XMLData
	{
		
		private var _name:String;
		private var _accessorName:String;
		private var _type:Class;
		private var _listClass:Class;
		
		public function XMLData()
		{
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(v:String):void
		{
			_name = v;
		}

		public function get accessorName():String
		{
			return _accessorName;
		}

		public function set accessorName(v:String):void
		{
			_accessorName = v;
		}

		public function get type():Class
		{
			return _type;
		}

		public function set type(v:Class):void
		{
			_type = v;
		}

		public function get listClass():Class
		{
			return _listClass;
		}

		public function set listClass(v:Class):void
		{
			_listClass = v;
		}


	}
}