package flexUnitTests
{
	import com.flashartofwar.fcss.styles.Style;
	import com.flashartofwar.fcss.styles.Style;

	import flexunit.framework.TestCase;

	public class StyleTest extends TestCase
	{
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private static const style_NAME:String = "teststyle";

		private var classToTestRef : com.flashartofwar.fcss.styles.Style;
		private var style:Style;

		public function StyleTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
		}

		//This method will be called before every test function
		override public function setUp():void
		{
			style = new Style();
			style.styleName = style_NAME;
			style.propA = "a";
			style.propB = "b";
			style.propC = "c";

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
			var clone:Style = style.clone();
			assertEquals(clone.toString(), style.toString());

		}

		public function testGet_styleName():void
		{
			// Add your test logic here
			assertEquals(style.styleName, style_NAME);
		}

		public function testSet_styleName():void
		{
			style.styleName = style_NAME+"Renamed";
			assertEquals(style.styleName, style_NAME+"Renamed");
		}

		public function testToString():void
		{
			var styleAsString:String = "teststyle{styleName:teststyle;propA:a;propB:b;propC:c;}";

			assertEquals(style.toString(), styleAsString);
		}

		private function getPropertyArray():Array
		{
			var prop:String;
			var props:Array = [];
			for(prop in style)
			{
				props.push(prop);
			}
			return props;
		}

		public function testPropertyOrder():void{

			var props:Array = getPropertyArray();

			// Add your test logic here
			assertEquals(props.indexOf("propB"), 2);
		}

		public function testMergestyleName():void{

			var newStyle:Style = new Style();
			newStyle.styleName = style_NAME + "Merge";

			style.merge(newStyle);

			assertEquals(style.styleName, style_NAME + "Merge");
		}

		public function testMergeNewProperty():void{

			var newStyle:Style = new Style();
			newStyle.propQ = "q";

			style.merge(newStyle);

			assertTrue(style.hasOwnProperty("propQ"));
		}

		public function testMergeSameProperty():void{

			var newStyle:Style = new Style();
			newStyle.propA = "a2";

			style.merge(newStyle);

			assertEquals(style.propA, "a2");
		}

		public function testAddProperty():void{
			style.propZ = "z";
			assertTrue( style.hasOwnProperty("propZ"));
		}

		public function testPropertyOrderAfterAdding():void{
			style.propZ = "z";

			var props:Array = getPropertyArray();

			assertTrue(props.indexOf("propZ"), (props.length -1));

		}

		public function testDeleteProperty():void{
			delete style.propA;
			assertFalse( style.hasOwnProperty("propA"));
		}

		public function testPropertyOrderAfterDelete():void{
			delete style.propB;

			var props:Array = getPropertyArray();

			assertTrue(props.indexOf("propC"), (2));
		}
	}
}

