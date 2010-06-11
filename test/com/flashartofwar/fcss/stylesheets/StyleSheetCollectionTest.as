package com.flashartofwar.fcss.stylesheets
{
    import com.flashartofwar.fcss.styles.IStyle;
    import com.flashartofwar.fcss.styles.Style;
    import com.flashartofwar.fcss.utils.CSSTidyUtil;

    import org.flexunit.Assert;

    public class StyleSheetCollectionTest
    {

        private var styleSheetA:FStyleSheet;
        private var styleSheetB:FStyleSheet;
        private var styleSheetCollection:StyleSheetCollection;

        [Before]
        public function runBeforeEveryTest():void
        {
            styleSheetCollection = new StyleSheetCollection();
            styleSheetA = new FStyleSheet("sheetA");
            styleSheetA.parseCSS(cssTextA);

            styleSheetB = new FStyleSheet("sheetB");
            styleSheetB.parseCSS(cssTextB);
        }

        [After]

        public function runAfterEveryTest():void
        {
            styleSheetCollection.clear();
            styleSheetCollection = null;
            styleSheetA = null;
            styleSheetB = null;
        }

        [Test]

        public function testAddStyleSheet():void
        {
            var createdSheet:IStyleSheet = styleSheetCollection.addStyleSheet(styleSheetA, "test");

            Assert.assertNotNull(createdSheet);
        }

        [Test]

        public function testClear():void
        {
            styleSheetCollection.clear();
            Assert.assertEquals(styleSheetCollection.totalStyleSheets, 0);
        }

        protected function addBothStyleSheets():void
        {
            styleSheetCollection.addStyleSheet(styleSheetA, "sheetA");
            styleSheetCollection.addStyleSheet(styleSheetB, "sheetB");
        }

        [Test]

        public function testGetStyle():void
        {
            addBothStyleSheets();
        }

        [Test]

        public function testStyleToStringFromSheet():void
        {
            addBothStyleSheets();

            var style:Style = styleSheetCollection.getStyle("baseStyle") as Style;
            var output:String = "baseStyle{styleName:baseStyle;x:300px;y:10;width:100;height:150px;padding:5;margin:0;}";
            Assert.assertEquals(style.toString(), output);
        }

        [Test]

        public function testDynamicStyleToString():void
        {

            var style:Style = new Style();
            style.styleName = "propTest";
            style.propA = "a";
            style.propB = "b";
            style.propC = "c";
            var output:String = "propTest{styleName:propTest;propA:a;propB:b;propC:c;}";
            Assert.assertEquals(style.toString(), output);
        }

        [Test]

        public function testGetStyleStyleName():void
        {
            addBothStyleSheets();

            var style:Style = styleSheetCollection.getStyle("baseStyle") as Style;
            Assert.assertEquals(style.styleName, "baseStyle");
        }

        [Test]

        public function testGetStylePropTestA():void
        {
            addBothStyleSheets();

            var style:Style = styleSheetCollection.getStyle("baseStyle") as Style;
            Assert.assertEquals(style.y, "10");
        }

        [Test]

        public function testGetStylePropTestB():void
        {
            addBothStyleSheets();

            var style:Style = styleSheetCollection.getStyle("baseStyle") as Style;
            Assert.assertEquals(style.width, "100");
        }

        [Test]

        public function testGetStylePropTestC():void
        {
            addBothStyleSheets();

            var style:Style = styleSheetCollection.getStyle("baseStyle") as Style;
            Assert.assertEquals(style.padding, "5");
        }

        [Test]

        public function testGetStylePropTestD():void
        {
            addBothStyleSheets();

            var style:Style = styleSheetCollection.getStyle("baseStyle") as Style;
            Assert.assertEquals(style.x, "300px");
        }

        [Test]

        public function testGetStyleSheet():void
        {
            styleSheetCollection.addStyleSheet(styleSheetA, "test");

            Assert.assertNotNull(styleSheetCollection.getStyleSheet("test"));
        }

        [Test]

        public function testGet_styleNames():void
        {
            addBothStyleSheets();
            var styles:Array = styleSheetCollection.styleNames;

            Assert.assertEquals(styles.length, 8);
        }

        [Test]

        public function testNewstyle():void
        {
            var style:Style = new Style();
            style.styleName = "Teststyle";

            styleSheetCollection.newStyle("Teststyle", style);
            Assert.assertEquals(styleSheetCollection.getStyle("Teststyle").styleName, "Teststyle");
        }

        [Test]

        public function testParseCSS():void
        {
            var tidyCSS:String = CSSTidyUtil.tidy(cssTextA);

            styleSheetCollection.parseCSS(cssTextA);
            var sheet:IStyleSheet = styleSheetCollection.baseStyleSheet;

            Assert.assertEquals(sheet.toString(), tidyCSS);
        }

        [Test]

        public function testRemoveStyleSheet():void
        {
            addBothStyleSheets();
            styleSheetCollection.removeStyleSheet("sheetB");

            Assert.assertNull(styleSheetCollection.getStyleSheet("sheetB"));
        }

        [Test]

        public function testGetStyleNamesReturnsCleanArray():void
        {
            addBothStyleSheets();

            var styleNames:Array = styleSheetCollection.styleNames;

            styleNames.length = 0;
            Assert.assertEquals(styleSheetCollection.styleNames.length, 8);
        }

        [Test]

        public function testGetStyleSheetFromParse():void
        {
            addBothStyleSheets();
            var sheet:IStyleSheet = styleSheetCollection.parseCSS("sheetB");
            Assert.assertEquals("Should find " + sheet.name, sheet.name, StyleSheetCollection.defaultSheetName + "3");
        }

        [Test]
        public function testHasStyle():void
        {
            addBothStyleSheets();
            Assert.assertTrue(styleSheetCollection.hasStyle("baseStyle"));
        }

        [Test]
        public function testDoesNotHaveStyle():void
        {
            addBothStyleSheets();
            Assert.assertFalse(styleSheetCollection.hasStyle("FooBar"));
        }

        [Test]
        public function testRemoveBaseStyleSheet():void
        {
            addBothStyleSheets();
            styleSheetCollection.removeStyleSheet("sheetA");
            var styleSheet:IStyleSheet = styleSheetCollection.baseStyleSheet;
            Assert.assertEquals(styleSheet.name, "sheetB");
        }

        [Test]
        public function testAddingStyleSheetWithSameNameOverrides():void
        {
            addBothStyleSheets();
            styleSheetCollection.addStyleSheet(styleSheetA, "sheetA");
            Assert.assertEquals(styleSheetCollection.styleSheetNames.join(), "sheetA,sheetB");
        }

        [Test]
        public function testReternCopyOfStyleSheetNamesAndNotAReference():void
        {
            var total:int = styleSheetCollection.styleSheetNames.length;
            var names:Array = styleSheetCollection.styleSheetNames;
            names.push("foobar");
            Assert.assertEquals(styleSheetCollection.styleSheetNames.length, total);
        }

        [Test]
        public function testForEmptyStyle():void
        {
            addBothStyleSheets();
            var style:IStyle = styleSheetCollection.getStyle("baseStyle", "#playButton");
            Assert.assertEquals(style.styleName, "#playButton");
        }

        [Test]

        public function testGetStylePropTestCWithEmptySelector():void
        {
            addBothStyleSheets();

            var style:Style = styleSheetCollection.getStyle("baseStyle", "foobar") as Style;
            Assert.assertEquals(style.padding, "5");
        }

        public function get cssTextA():String
        {
            var xml:XML = <css>
                <![CDATA[/* This is a comment in the CSS file */
            baseStyle {
                    x: 10;
                    y: 10;
                    width: 100;
                    height: 100;
                    padding: 5;
                    margin: 10;
                    }

            baseStyle .Button{
                    x: 0;
                    y: 0;
                    background-color: #000000;
                    }

            #playButton {
                    background - color: #FFFFFF;
                    background-image: url('/images/full_screen_background.jpg');
                    }

            #fullScreenButton{
                    background - color: #FF0000;
                    background-image: url('/images/full_screen_background.jpg');
                    }

            #playButton:over {
                    background - color: #333333;
                    }

            interactive {
                    cursor: hand;
                    }

            baseStyle interactive .SimpleButton
            {
                    width: 100;
                    height: 100;
                    }
            ]]>
            </css>;

            return xml.toString();
        }

        public function get cssTextB():String
        {
            var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
                        baseStyle {
                        x: 300px;
                        height: 150px;
                        margin: 0;
                        }

                extraStyle
                {
                        debug: true;
                        }
                ]]>
            </css>
                    ;
            return xml.toString();
        }
    }
}

