package asaxb.test
{

	[XmlRootNode(name="outer-object")]
	public class OuterObject
	{
		
		[XmlAttribute(name="var1")]
		public var variable1:String;
		
		[XmlElement(name="var2")]
		public var variable2:Boolean;
		
		[XmlElement(name="testns:var3")]
		public var variable3:String;
		
		private var _level:int;
		private var _outer:Boolean;
		private var _element:String;
		private var _innerObjects:Array;
		
		
		public function OuterObject()
		{
			_level = 1;
			_outer = true;
			_element = "Test Element";
			_innerObjects = [];
			variable1 = "This is a valiable attribute";
			variable2 = true;
			variable3 = "This is a variable attribute in testns namespace";
		}
		
		public function addInnerObject(innerObject:InnerObject):void
		{
			_innerObjects.push(innerObject);
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

		[XmlElements(name="inner-object",type="asaxb.test.InnerObject")]
		public function get innerObjects():Array
		{
			return _innerObjects;
		}

		public function set innerObjects(innerObjects:Array):void
		{
			_innerObjects = innerObjects;
		}
		
		public function ignoreMe():void
		{
			
		}

	}
}