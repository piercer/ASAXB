package asaxb.test
{

	[XmlRootNode(name="outer-object")]
	public class OuterObject
	{
		
		private var _level:int;
		private var _outer:Boolean;
		private var _element:String;
		
		public function OuterObject()
		{
			_level = 1;
			_outer = true;
			_element = "Test Element";
		}
		
		[XmlAttribute(name="level")]
		public function get attribute1():int
		{
			return _level;
		}
		
		public function set attribute1(value:int):void
		{
			_level = value;
		}

		[XmlAttribute(name="outer")]
		public function get attribute2():Boolean
		{
			return _outer;
		}

		public function set attribute2(value:Boolean):void
		{
			_outer = value;
		}

		[XmlElement(name="test-element")]
		public function get element():String
		{
			return _element;
		}

		public function set element(value:String):void
		{
			_element = value;
		}


		[XmlElements(name="inner-objects")]
		public function get element2():Array
		{
			return [ new InnerObject(2), new InnerObject(2), new InnerObject(2) ];
		}
		
		public function ignoreMe():void
		{
			
		}

	}
}