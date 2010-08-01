package asaxb.xml.helpers
{
	
	import asaxb.xml.adapter.XMLAdapter;

	public class XMLData
	{
		
		private var _name:String;
		private var _accessorName:String;
		private var _wrapperNodeName:String;
		private var _type:Class;
		private var _listClass:Class;
		private var _adapter:XMLAdapter;
		private var _isCDATA:Boolean;
		
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

		public function get wrapperNodeName():String
		{
			return _wrapperNodeName;
		}

		public function set wrapperNodeName(v:String):void
		{
			_wrapperNodeName = v;
		}

		public function get adapter():XMLAdapter
		{
			return _adapter;
		}

		public function set adapter(v:XMLAdapter):void
		{
			_adapter = v;
		}

		public function get isCDATA():Boolean
		{
			return _isCDATA;
		}

		public function set isCDATA(v:Boolean):void
		{
			_isCDATA = v;
		}


	}
}