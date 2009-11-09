package com.flashartofwar.fcss.utils
{
	import flash.net.URLRequest;
	
	import flexunit.framework.Assert;

	public class TypeHelperUtilTest
	{
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef : com.flashartofwar.fcss.utils.TypeHelperUtil;

		public function TypeHelperUtilTest()
		{
		}

		[Test]
		public function testStringToArray():void
		{
			// Add your test logic here
			var input:String = "test1 test2 test3";
			var output:Array = TypeHelperUtil.stringToArray(input);
			Assert.assertEquals(output.length, 3);
		}


		[Test]
		public function testStringToBoolean():void
		{
			var input:String = "true";
			Assert.assertTrue(TypeHelperUtil.stringToBoolean(input));
		}
		
		[Test]
		public function testStringToNumber():void
		{
			var input:String = "5";
			Assert.assertEquals(input, 5);
		}

		[Test]
		public function testStringToUrlRequest():void
		{
			// Add your test logic here
			var url:String = "http://fcss.flashartofwar.com";
			var input:String = "url('"+url+"')";
			var output:URLRequest = TypeHelperUtil.stringToUrlRequest(input);

			Assert.assertTrue((output is URLRequest));
		}

		[Test]
		public function testStringToUrlRequestUrl():void
		{
			// Add your test logic here
			var url:String = "http://fcss.flashartofwar.com";
			var input:String = "url('"+url+"')";
			var output:URLRequest = TypeHelperUtil.stringToUrlRequest(input);

			Assert.assertEquals(output.url, url);
		}

		[Test]
		public function testStringYesNoToBooleanTrue():void
		{
			// Add your test logic here

			var input:String = "yes";

			var output:Boolean = TypeHelperUtil.stringYesNoToBoolean(input);

			Assert.assertTrue(output);
		}

		[Test]
		public function testStringYesNoToBooleanFalse():void
		{
			// Add your test logic here

			var input:String = "no";

			var output:Boolean = TypeHelperUtil.stringYesNoToBoolean(input);

			Assert.assertFalse(output);
		}
	}
}

