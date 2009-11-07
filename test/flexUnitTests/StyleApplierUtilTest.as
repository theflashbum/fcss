package flexUnitTests
{
	import com.flashartofwar.fcss.objects.PropertyMapObject;
	import com.flashartofwar.fcss.styles.Style;
	import com.flashartofwar.fcss.utils.StyleApplierUtil;

	import flexunit.framework.TestCase;

	public class StyleApplierUtilTest extends TestCase
	{

		public function StyleApplierUtilTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
		}
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef : com.flashartofwar.fcss.utils.StyleApplierUtil;

		//This method will be called before every test function
		override public function setUp():void
		{
			//TODO: implement function
			super.setUp();
		}

		//This method will be called after every test function
		override public function tearDown():void
		{
			//TODO: implement function
			super.tearDown();
		}

		public function testApplyProperties():void
		{
			// Add your test logic here

			var style:Style = new Style();
			style.name = "F*CSS";
			style.speed = "10";
			style.items = "item1,item2,item3";

			var dc:DummyClass = new DummyClass();
			StyleApplierUtil.applyProperties(dc, style);

			var pass:Boolean = ((dc.name == "F*CSS") && (dc.speed == 10) && (dc.items is Array));
			assertTrue(pass);

		}

		public function testPropertyMapObject():void
		{
			var propertyMap:PropertyMapObject = StyleApplierUtil.propertyMap(DummyClass);
			var pass:Boolean = ((propertyMap.name == "string") && (propertyMap.speed == "number") && (propertyMap.items == "array"))
			assertTrue(pass);
		}
	}
}

class DummyClass
{

	public function DummyClass()
	{
		// Does nothing
	}

	public var items:Array;
	public var name:String;
	public var speed:Number;
}

