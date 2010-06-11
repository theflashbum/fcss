package com.flashartofwar.fcss.stylesheets
{
    import com.flashartofwar.fcss.styles.IStyle;

    import org.flexunit.Assert;

    public class StyleSheetCollectionMultipleStyleSheetMergeTest extends StyleSheetCollection
    {
        private var styleSheetA:FStyleSheet;
        private var styleSheetB:FStyleSheet;

        public function StyleSheetCollectionMultipleStyleSheetMergeTest()
        {
            super();
        }

        public function get cssTextA():String
        {
            var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								baseStyle {
									x: 10;
									y: 10;
									width: 100;
									height: 100;
									padding: 5;
									margin: 10;
								}
								
								interactive {
									cursor: hand;
								}
								
								baseStyle interactive .SimpleButton
								{
									width: 75px;
									height: 30;
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
								
								border
								{
									border: 1px solid black;
								}
				
								border .SimpleButton
								{
									debug: true;
								}
								
								baseStyle #thickBorder
								{
									x: 0;
									border: 10px solid green;
								}
							]]>
            </css>;
            return xml.toString();
        }

        [Before]

        public function runBeforeEveryTest():void
        {
            styleSheetA = new FStyleSheet();
            styleSheetA.parseCSS(cssTextA);
            addStyleSheet(styleSheetA, "sheetA");

            styleSheetB = new FStyleSheet();
            styleSheetB.parseCSS(cssTextB);
        }

        [After]

        public function runAfterEveryTest():void
        {
            clear();
            styleSheetA = null;
            styleSheetB = null;
        }

        [Test]
        public function testTotalNumberOfSheetsIsOne():void
        {
            Assert.assertEquals(totalStyleSheets, 1);
            Assert.assertEquals(styleSheetInstances.length, 1);
            Assert.assertEquals(styleSheetNames.length, 1);
        }

        [Test]
        public function testStyleSheetLengthIsOne():void
        {
            var total:int = 0;
            var sheet:String;
            for (sheet in styleSheetInstances)
            {
                total ++;
            }
            Assert.assertEquals(total, 1);
        }

        [Test]
        public function testRequestStyleRelatedSelectorsFromSheetA():void
        {
            var related:Array = relatedStyles(".SimpleButton");
            Assert.assertEquals(related.join(), "baseStyle,interactive");
        }

        [Test]
        public function testRequestStyleRelatedSelectorsFromSheetAAndB():void
        {
            addStyleSheet(styleSheetB, "sheetB");
            var related:Array = relatedStyles(".SimpleButton");
            Assert.assertEquals(related.join(), "baseStyle,interactive,border");
        }

        [Test]
        public function testGetUnmergedStyleFromSheetA():void
        {
            var output:String = ".SimpleButton{styleName:.SimpleButton;width:75px;height:30;}";
            var style:IStyle = styleLookup(".SimpleButton", false);
            Assert.assertEquals(style.toString(), output);

        }

        [Test]
        public function testGetUnmergedStyleFromSheetAAndB():void
        {
            addStyleSheet(styleSheetB, "sheetB");
            var output:String = ".SimpleButton{styleName:.SimpleButton;width:75px;height:30;debug:true;}";
            var style:IStyle = styleLookup(".SimpleButton", false);
            Assert.assertEquals(style.toString(), output);
        }

        [Test]
        public function testStyleInheritanceChain():void
        {
            addStyleSheet(styleSheetB, "sheetB");
            var chain:Array = styleInheritanceChain(".SimpleButton");
            var expected:String = "baseStyle,interactive,border,.SimpleButton";
            Assert.assertEquals(chain, expected);
        }

        [Test]
        public function testGetStyleFromSheetAAndBUsingInheritanceChain():void
        {
            addStyleSheet(styleSheetB, "sheetB");
            var chain:Array = styleInheritanceChain(".SimpleButton");
            var style:IStyle = getStyle.apply(null, chain);
            var expected:String = ".SimpleButton{styleName:.SimpleButton;x:300px;y:10;width:75px;height:30;padding:5;margin:0;cursor:hand;border:1px solid black;debug:true;}";
            Assert.assertEquals(style.toString(), expected);
        }

        [Test]
        public function testNoneDestructiveAddThenRemovalOfStyleSheet():void
        {
            addStyleSheet(styleSheetB, "sheetB");
            removeStyleSheet("sheetB");
            var style:IStyle = getStyle("baseStyle");
            var expected:String = "baseStyle{styleName:baseStyle;x:10;y:10;width:100;height:100;padding:5;margin:10;}"
            Assert.assertEquals(style.toString(), expected);
        }

        [Test]
        public function testNoneDestructiveAddThenRemovalOfBaseStyleSheet():void
        {
            addStyleSheet(styleSheetB, "sheetB");
            removeStyleSheet("sheetA");
            var style:IStyle = getStyle("baseStyle");
            var expected:String = "baseStyle{styleName:baseStyle;x:300px;height:150px;margin:0;}"
            Assert.assertEquals(style.toString(), expected);
        }

        [Test]
        public function testLocalStyleInheritanceSheetB():void
        {
            addStyleSheet(styleSheetB, "sheetB");
            var style:IStyle = getStyle("#thickBorder");
            var expected:String = "#thickBorder{styleName:#thickBorder;x:0;y:10;width:100;height:150px;padding:5;margin:0;border:10px solid green;}";
            Assert.assertEquals(style.toString(), expected);
        }

    }
}