package asaxb.test
{

	[XmlRootNode(name='inner-inner-object')]
	public class InnerInnerObject
	{
		
		private var _level:uint;

		public function InnerInnerObject(level:uint)
		{
			_level = level;
		}
		
		[XmlAttribute(name="level")]
		public function get attribute1():uint
		{
			return _level;
		}
		
		[XmlElement(name="element")]
		public function get element1():String
		{
			return "I'm inside at level "+_level;
		}


	}
}