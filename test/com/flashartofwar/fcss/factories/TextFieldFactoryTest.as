package com.flashartofwar.fcss.factories
{
    import com.flashartofwar.fcss.applicators.TextFieldApplicator;
    import com.flashartofwar.fcss.enum.ColorsByName;
    import com.flashartofwar.fcss.stylesheets.IStyleSheetCollection;
    import com.flashartofwar.fcss.stylesheets.StyleSheetCollection;

    import flash.text.TextField;
    import flash.text.TextFormat;

    import org.flexunit.Assert;

    public class TextFieldFactoryTest
    {
        private var textField:TextField;
        private var tfx:TextFormat;

        public function TextFieldFactoryTest()
        {
        }

        public function get cssText():String
        {
            var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								.TextField
								{
									alwaysShowSelection: true;
									antiAliasType: advanced;
									autoSize: center;
									background: true;
									backgroundColor: blue;
									border: true;
									borderColor: red;
									condenseWhite: true;
									displayAsPassword: true;
									embedFonts: true;
									gridFitType: true;
									maxChars: 100;
									mouseWheelEnabled: true;
									multiline: true;
									restrict: A-Z 0-9;
									selectable: true;
									sharpness: 50;
									textColor: red;
									thickness: 100;
									wordWrap: true;
									width: 50;
									height: 50;
									alpha: .5;
									x: 100;
									y: 50;
									rotation: 20;
									styleSheet: a;
								}
								
								#DemoTextField
								{
									align: center;
									blockIndent: 10;
									bold: true;
									bullet: true;
									color: red;
									font: Times New Roman;
									indent: 10;
									italic: true;
									kerning: true;
									leading: 10;
									leftMargin: 10;
									letterSpacing: 10;
									rightMargin: 10;
									size: 10;
									underline: true;
								}
				
								a{color:#ff0000}
				
							]]>
            </css>;
            return xml.toString();
        }

        //This method will be called before every test function
        [Before(ui)]
        public function runBeforeEachTest():void
        {
            var collection:IStyleSheetCollection = new StyleSheetCollection();

            collection.parseCSS(cssText);

            var tff:TextFieldFactory = new TextFieldFactory(new TextFieldApplicator(), collection);

            textField = tff.createTextField("DemoTextField");
            textField.htmlText = "Hello World!";

            tfx = textField.defaultTextFormat;

        }

        /*** TextField Tests ***/
        [Test]
        public function testGet_alwaysShowSelection():void
        {
            Assert.assertTrue(textField.alwaysShowSelection);
        }

        [Test]
        public function testGet_antiAliasType():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.antiAliasType, "advanced");
        }

        [Test]
        public function testGet_autoSize():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.autoSize, "center");
        }

        [Test]
        public function testGet_background():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.background);
        }

        [Test]
        public function testGet_backgroundColor():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.backgroundColor, ColorsByName.convertColor("blue"));
        }

        [Test]
        public function testGet_border():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.border);
        }

        [Test]
        public function testGet_borderColor():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.borderColor, ColorsByName.convertColor("red"));
        }

        [Test]
        public function testGet_condenseWhite():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.condenseWhite);
        }

        [Test]
        public function testGet_defaultTextFormat():void
        {
            // Add your test logic here
            Assert.assertNotNull(textField.defaultTextFormat);
        }

        [Test]
        public function testGet_displayAsPassword():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.displayAsPassword);
        }

        [Test]
        public function testGet_embedFonts():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.embedFonts);
        }

        [Test]
        public function testGet_gridFitType():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.gridFitType);
        }

        [Test]
        public function testGet_maxChars():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.maxChars, 100);
        }

        [Test]
        public function testGet_mouseWheelEnabled():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.mouseEnabled);
        }

        [Test]
        public function testGet_multiline():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.multiline);
        }

        [Test]
        public function testGet_restrict():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.restrict, "A-Z 0-9");
        }

        [Test]
        public function testGet_selectable():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.multiline);
        }

        [Test]
        public function testGet_sharpness():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.sharpness, 50);
        }

        [Test]
        public function testGet_styleSheet():void
        {
            // Add your test logic here
            Assert.assertNotNull(textField.styleSheet);
        }

        [Test]
        public function testGet_textColor():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.textColor, ColorsByName.convertColor("red"));
        }

        [Test]
        public function testGet_thickness():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.thickness, 100);
        }

        [Test]
        public function testGet_wordWrap():void
        {
            // Add your test logic here
            Assert.assertTrue(textField.wordWrap);
        }

        /*** TextFormat Tests ***/

        [Test]
        public function testGet_align():void
        {
            Assert.assertEquals(tfx.align, "center");
        }

        [Test]
        public function testGet_blockIndent():void
        {
            Assert.assertEquals(tfx.blockIndent, 10);
        }

        [Test]
        public function testGet_bold():void
        {
            // Add your test logic here
            Assert.assertTrue(tfx.bold);
        }

        [Test]
        public function testGet_bullet():void
        {
            // Add your test logic here
            Assert.assertTrue(tfx.bullet);
        }

        [Test]
        public function testGet_color():void
        {
            // Add your test logic here
            Assert.assertEquals(tfx.color, 0xff0000);
        }

        [Test]
        public function testGet_font():void
        {
            // Add your test logic here
            Assert.assertEquals(tfx.font, "Times New Roman");
        }

        [Test]
        public function testGet_indent():void
        {
            // Add your test logic here
            Assert.assertEquals(tfx.indent, 10);
        }

        [Test]
        public function testGet_italic():void
        {
            // Add your test logic here
            Assert.assertTrue(tfx.italic);
        }

        [Test]
        public function testGet_kerning():void
        {
            // Add your test logic here
            Assert.assertTrue(tfx.kerning);
        }

        [Test]
        public function testGet_leading():void
        {
            // Add your test logic here
            Assert.assertEquals(tfx.leading, 10);
        }

        [Test]
        public function testGet_leftMargin():void
        {
            // Add your test logic here
            Assert.assertEquals(tfx.leftMargin, 10);
        }

        [Test]
        public function testGet_letterSpacing():void
        {
            // Add your test logic here
            Assert.assertEquals(tfx.letterSpacing, 10);
        }

        [Test]
        public function testGet_rightMargin():void
        {
            // Add your test logic here
            Assert.assertEquals(tfx.rightMargin, 10);
        }

        [Test]
        public function testGet_size():void
        {
            // Add your test logic here
            Assert.assertEquals(tfx.size, 10);
        }

        [Test]
        public function testGet_underline():void
        {
            // Add your test logic here
            Assert.assertTrue(tfx.kerning);
        }

        [Test]
        public function testHTMLText():void
        {
            // Add your test logic here
            Assert.assertEquals(textField.htmlText, 'Hello World!');
        }

        [Test]
        public function testNativeStyleSheet():void
        {
            Assert.assertEquals(textField.styleSheet.styleNames.length, 1);
        }

    }
}