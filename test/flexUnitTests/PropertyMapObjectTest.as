package flexUnitTests
{
	import com.flashartofwar.fcss.objects.PropertyMapObject;

	import flexunit.framework.TestCase;

	public class PropertyMapObjectTest extends TestCase
	{
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef : com.flashartofwar.fcss.objects.PropertyMapObject;
		private var propMap:PropertyMapObject;

		public function PropertyMapObjectTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
		}

		//This method will be called before every test function
		override public function setUp():void
		{
			propMap = new PropertyMapObject();
			propMap.propA = "string";
			propMap.propB = "number";
			propMap.propC = "number";
			propMap.propC = "number";
			propMap.propC = "array";

			super.setUp();
		}

		//This method will be called after every test function
		override public function tearDown():void
		{
			//TODO: implement function
			super.tearDown();
		}

		public function testClone():void
		{
			var clone:PropertyMapObject = propMap.clone();
			assertEquals(propMap.toString(), propMap.toString());
		}

		public function testGetPropsByTypes():void
		{
			assertEquals(propMap.getPropsByTypes("string", "number").length,4); 
		}

		public function testToString():void
		{
			var propMapAsString:String = "{propA:string;propB:number;propC:array;}";
			assertEquals(propMap.toString(), propMapAsString);
		}

		public function testGetPropsByTypesReturnsCleanArray():void
		{
			var props:Array = propMap.getPropsByTypes("string", "number");
			props.length = 0;

			var props2:Array = propMap.getPropsByTypes("string", "number");
			assertEquals(props2.length, 4);
		}
	}
}

