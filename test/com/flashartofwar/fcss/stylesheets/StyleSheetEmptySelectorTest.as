package com.flashartofwar.fcss.stylesheets
{
    import com.flashartofwar.fcss.styles.IStyle;

    import org.flexunit.Assert;

    public class StyleSheetEmptySelectorTest
    {

        private var collection:IStyleSheetCollection = new StyleSheetCollection();

        [Before(ui)]
        public function runBeforeEachTest():void
        {

        }

        [Test]
        public function testForEmptyStyle():void
        {
            collection.parseCSS(cssText);
            var style:IStyle = collection.getStyle("DummyClass", "#dummyClassB", "bla");
            Assert.assertEquals(style.styleName, "#dummyClassB");
        }

        public function get cssText():String
        {
            var xml:XML = <css>
                <![CDATA[/* This is a comment in the CSS file */

            DummyClass {
                    name: DummyClass;
                    x:50;
                    y:50;
                    visible:false;
                    }
            .CustomDummyClassName
            {
                    z:300;
                    }

            #dummyClassB{
                    y:100;
                    visible: true;
                    }

            #testStyle
            {
                    name: testStyle;
                    x: 350;
                    }

            #dummyClassB:over
            {
                    y: 600;
                    }

            ]]>
            </css>;
            return xml.toString();
        }
    }
}