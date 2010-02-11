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
            Assert.assertEquals(new CSSTidyUtil(cssText).toString(), "baseStyle{x:300px;height:150;margin:0;}baseStyle .SimpleButton{border:#ff0000;}");
        }
    }
}

