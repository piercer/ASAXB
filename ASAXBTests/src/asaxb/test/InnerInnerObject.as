package asaxb.test
{

	[XmlRootNode(name="inner-inner-object")]
	public class InnerInnerObject
	{
		
		private var _level:uint;
		private var _element1:String;

		public function InnerInnerObject()
		{
		}
		
		[XmlAttribute(name="level")]
		public function get attribute1():uint
		{
			return _level;
		}

		public function set attribute1(level:uint):void
		{
			_level = level;
		}
		
		[XmlElement(name="element")]
		public function get element1():String
		{
			return "I'm inside at level "+_level;
		}

		public function set element1(element1:String):void
		{
			_element1 = element1;
		}


	}
}