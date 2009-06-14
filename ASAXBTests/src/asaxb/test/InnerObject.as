package asaxb.test
{

	[XmlRootNode(name='inner-object')]
	public class InnerObject
	{
		
		private var _level:uint;
		private var _innerObjects:Array;

		public function InnerObject(level:uint)
		{
			_level = level;
			_innerObjects = [];
		}
		
		public function addInnerObject(innerObject:InnerInnerObject):void
		{
			_innerObjects.push(innerObject);
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
			return _innerObjects;
		}


	}
}