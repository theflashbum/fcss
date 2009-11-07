package flexUnitTests
{
	import com.flashartofwar.fcss.utils.TypeHelperUtil;

	import flash.net.URLRequest;

	import flexunit.framework.TestCase;

	public class TypeHelperUtilTest extends TestCase
	{
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef : com.flashartofwar.fcss.utils.TypeHelperUtil;

		public function TypeHelperUtilTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
		}

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

		/*public function testGetType():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testRegisterColor():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testRegisterFunction():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testRemoveColor():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testRemoveFunction():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testRgbToHex():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testSplitTypeFromSource():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }
		 */
		public function testStringToArray():void
		{
			// Add your test logic here
			var input:String = "test1 test2 test3";
			var output:Array = TypeHelperUtil.stringToArray(input);
			assertEquals(output.length, 3);
		}


		public function testStringToBoolean():void
		{
			var input:String = "true";
			assertTrue(TypeHelperUtil.stringToBoolean(input));
		}
		/*
		   public function testStringToDictionary():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }
		 */
		public function testStringToNumber():void
		{
			var input:String = "5";
			assertEquals(input, 5);
		}
		/*
		   public function testStringToObject():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testStringToPoint():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testStringToRectangle():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testStringToStyleSheet():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");
		   }

		   public function testStringToUint():void
		   {
		   // Add your test logic here
		   fail("Test method Not yet implemented");

		   var input:String = "0x000000";
		   var output:uint = TypeHelperUtil.stringToUint(input);

		   assertTrue((output is uint));
		   }
		 */

		public function testStringToUrlRequest():void
		{
			// Add your test logic here
			var url:String = "http://fcss.flashartofwar.com";
			var input:String = "url('"+url+"')";
			var output:URLRequest = TypeHelperUtil.stringToUrlRequest(input);

			assertTrue((output is URLRequest));
		}

		public function testStringToUrlRequestUrl():void
		{
			// Add your test logic here
			var url:String = "http://fcss.flashartofwar.com";
			var input:String = "url('"+url+"')";
			var output:URLRequest = TypeHelperUtil.stringToUrlRequest(input);

			assertEquals(output.url, url);
		}

		public function testStringYesNoToBooleanTrue():void
		{
			// Add your test logic here

			var input:String = "yes";

			var output:Boolean = TypeHelperUtil.stringYesNoToBoolean(input);

			assertTrue(output);
		}

		public function testStringYesNoToBooleanFalse():void
		{
			// Add your test logic here

			var input:String = "no";

			var output:Boolean = TypeHelperUtil.stringYesNoToBoolean(input);

			assertFalse(output);
		}
	}
}

