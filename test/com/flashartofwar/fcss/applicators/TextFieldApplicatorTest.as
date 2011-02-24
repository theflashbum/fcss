package com.flashartofwar.fcss.applicators
{
    import com.flashartofwar.fcss.enum.CSSProperties;
    import com.flashartofwar.fcss.enum.ColorsByName;
    import com.flashartofwar.fcss.styles.Style;

    import flash.text.TextField;
    import flash.text.TextFormat;

    import flexunit.framework.Assert;

    public class TextFieldApplicatorTest
    {
        private var textField:TextField;
        private var tfx:TextFormat;
        private var applicator:IApplicator = new TextFieldApplicator();

        public function TextFieldApplicatorTest()
        {

        }

        [Before(ui)]
        public function runBeforeEachTest():void
        {
            var style:Style = new Style();
            style[CSSProperties.ALWAYS_SHOW_SELECTION] = "true";
            style[CSSProperties.ANTI_ALIAS_TYPE] = "advanced";
            style[CSSProperties.AUTO_SIZE] = "center";
            style[CSSProperties.BACKGROUND] = "true";
            style[CSSProperties.BACKGROUND_COLOR] = "blue";
            style[CSSProperties.BORDER] = "true";
            style[CSSProperties.BORDER_COLOR] = "red";
            style[CSSProperties.CONDENSE_WHITE] = "true";
            style[CSSProperties.DISPLAY_AS_PASSWORD] = "true";
            style[CSSProperties.EMBED_FONTS] = "true";
            style[CSSProperties.GRID_FIT_TYPE] = "true";
            style[CSSProperties.MAX_CHARS] = "100";
            style[CSSProperties.MOUSE_WHEEL_ENABLED] = "true";
            style[CSSProperties.MULTILINE] = "true";
            style[CSSProperties.RESTRICT] = "A-Z 0-9";
            style[CSSProperties.SELECTABLE] = "true";
            style[CSSProperties.SHARPNESS] = "50";
            style[CSSProperties.TEXT_COLOR] = "red";
            style[CSSProperties.THICKNESS] = "100";
            style[CSSProperties.WORD_WRAP] = "true";
            style[CSSProperties.WIDTH] = "50";
            style[CSSProperties.HEIGHT] = "50";
            style[CSSProperties.ALPHA] = ".5";
            style[CSSProperties.X] = "100";
            style[CSSProperties.Y] = "50";
            style[CSSProperties.ROTATION] = "20";
            style[CSSProperties.STYLE_SHEET] = "a{color:#ff0000}";

            // TextFormat
            style[CSSProperties.ALIGN] = "center";
            style[CSSProperties.BLOCK_INDENT] = "10";
            style[CSSProperties.BOLD] = "true";
            style[CSSProperties.BULLET] = "true";
            style[CSSProperties.COLOR] = "red";
            style[CSSProperties.FONT] = "Times New Roman";
            style[CSSProperties.INDENT] = "10";
            style[CSSProperties.ITALIC] = "true";
            style[CSSProperties.KERNING] = "true";
            style[CSSProperties.LEADING] = "10";
            style[CSSProperties.LEFT_MARGIN] = "10";
            style[CSSProperties.LETTER_SPACING] = "10";
            style[CSSProperties.RIGHT_MARGIN] = "10";
            style[CSSProperties.SIZE] = "10";
            style[CSSProperties.UNDERLINE] = "true";

            textField = new TextField();

            applicator.applyStyle(textField, style);
            //TextFieldUtil.applyStyle(textField, style);

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
        public function testNativeStyleSheet():void
        {
            Assert.assertEquals(textField.styleSheet.styleNames.length, 1);
        }

        [Test(expected="Error")]
        public function testApplyStyleTextFieldTestFail():void
        {
            applicator.applyStyle({foo:"bar"}, new Style());

        }

    }
}

