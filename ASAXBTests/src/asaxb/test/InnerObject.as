package asaxb.test
{

	[XmlRootNode(name='inner-object')]
	public class InnerObject
	{
		
		private var _level:uint;

		public function InnerObject(level:uint)
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

		[XmlElements(name="inner-inner-objects")]
		public function get elements():Array
		{
			return [ new InnerInnerObject(3) ];
		}


	}
}