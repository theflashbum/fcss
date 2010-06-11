package com.flashartofwar.fcss.utils
{
    import org.flexunit.Assert;

    public class CSSTidyUtilTest
    {

        public function CSSTidyUtilTest()
        {

        }

        public function get cssText():String
        {
            var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								baseStyle {
									x: 300px;
									height: 150;
									margin: 0;
								}
								
								baseStyle .SimpleButton
								{
									border: 		#ff0000;	
								}
							]]>
            </css>;
            return xml.toString();
        }

        [Test]
        public function testTidy():void
        {
            // Add your test logic here
            var tidyCSS:String = CSSTidyUtil.tidy(cssText);
            //trace(tidyCSS);
            Assert.assertEquals(tidyCSS, "baseStyle{x:300px;height:150;margin:0;}baseStyle .SimpleButton{border:#ff0000;}");
        }
    }
}

