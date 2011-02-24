package com.flashartofwar.fcss.utils
{
    import flash.net.URLRequest;

    import org.flexunit.Assert;

    import com.flashartofwar.fcss.typer.stringToArray;
    import com.flashartofwar.fcss.typer.stringToBoolean;
    import com.flashartofwar.fcss.typer.stringToUrlRequest;
    import com.flashartofwar.fcss.typer.stringYesNoToBoolean;

    public class TypeHelperUtilTest
    {

        public function TypeHelperUtilTest()
        {
        }

        [Test]
        public function testStringToArray():void
        {
            // Add your test logic here
            var input:String = "test1 test2 test3";
            var output:Array = stringToArray(input);
            Assert.assertEquals(output.length, 3);
        }


        [Test]
        public function testStringToBoolean():void
        {
            var input:String = "true";
            Assert.assertTrue(stringToBoolean(input));
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
            var input:String = "url('" + url + "')";
            var output:URLRequest = stringToUrlRequest(input);

            Assert.assertTrue((output is URLRequest));
        }

        [Test]
        public function testStringToUrlRequestUrl():void
        {
            // Add your test logic here
            var url:String = "http://fcss.flashartofwar.com";
            var input:String = "url('" + url + "')";
            var output:URLRequest = stringToUrlRequest(input);

            Assert.assertEquals(output.url, url);
        }

        [Test]
        public function testStringYesNoToBooleanTrue():void
        {
            // Add your test logic here

            var input:String = "yes";

            var output:Boolean = stringYesNoToBoolean(input);

            Assert.assertTrue(output);
        }

        [Test]
        public function testStringYesNoToBooleanFalse():void
        {
            // Add your test logic here

            var input:String = "no";

            var output:Boolean = stringYesNoToBoolean(input);

            Assert.assertFalse(output);
        }
    }
}

