package asaxb.test
{

	[XmlRootNode(name='inner-object')]
	public class InnerObject
	{
		[XmlAttribute(name="testns:var4")]
		public var variable4:String;
		
		private var _level:uint;
		private var _element1:String;
		private var _innerObjects:Array;

		public function InnerObject()
		{
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

		[XmlElements(name="inner-inner-object",type="asaxb.test.InnerInnerObject")]
		public function get elements():Array
		{
			return _innerObjects;
		}

		public function set elements(innerObjects:Array):void
		{
			_innerObjects = innerObjects;
		}


	}
}