package flexUnitTests
{
	import com.flashartofwar.fcss.enum.CSSProperties;
	import com.flashartofwar.fcss.styles.Style;
	import com.flashartofwar.fcss.utils.TextFieldUtil;
	import com.flashartofwar.fcss.utils.TypeHelperUtil;

	import flash.text.TextField;
	import flash.text.TextFormat;

	import flexunit.framework.TestCase;

	public class TextFieldUtilTest extends TestCase
	{
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef : com.flashartofwar.fcss.utils.TextFieldUtil;
		private var textField:TextField;
		private var tfx:TextFormat;

		public function TextFieldUtilTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
		}

		//This method will be called before every test function
		override public function setUp():void
		{
			//TODO: implement function
			super.setUp();

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

			TextFieldUtil.applyStyle(textField, style);

			tfx = textField.defaultTextFormat;

		}

		//This method will be called after every test function
		override public function tearDown():void
		{
			//TODO: implement function
			super.tearDown();
		}

		/*** TextField Tests ***/
		public function testGet_alwaysShowSelection():void
		{
			assertTrue(textField.alwaysShowSelection);
		}

		public function testGet_antiAliasType():void
		{
			// Add your test logic here
			assertEquals(textField.antiAliasType, "advanced");
		}

		public function testGet_autoSize():void
		{
			// Add your test logic here
			assertEquals(textField.autoSize, "center");
		}

		public function testGet_background():void
		{
			// Add your test logic here
			assertTrue(textField.background);
		}

		public function testGet_backgroundColor():void
		{
			// Add your test logic here
			assertEquals(textField.backgroundColor, TypeHelperUtil.stringToUint("blue"));
		}

		public function testGet_border():void
		{
			// Add your test logic here
			assertTrue(textField.border);
		}

		public function testGet_borderColor():void
		{
			// Add your test logic here
			assertEquals(textField.borderColor, TypeHelperUtil.stringToUint("red"));
		}

		public function testGet_condenseWhite():void
		{
			// Add your test logic here
			assertTrue(textField.condenseWhite);
		}

		public function testGet_defaultTextFormat():void
		{
			// Add your test logic here
			assertNotUndefined(textField.defaultTextFormat);
		}

		public function testGet_displayAsPassword():void
		{
			// Add your test logic here
			assertTrue(textField.displayAsPassword);
		}

		public function testGet_embedFonts():void
		{
			// Add your test logic here
			assertTrue(textField.embedFonts);
		}

		public function testGet_gridFitType():void
		{
			// Add your test logic here
			assertTrue(textField.gridFitType);
		}

		public function testGet_maxChars():void
		{
			// Add your test logic here
			assertEquals(textField.maxChars, 100);
		}

		public function testGet_mouseWheelEnabled():void
		{
			// Add your test logic here
			assertTrue(textField.mouseEnabled);
		}

		public function testGet_multiline():void
		{
			// Add your test logic here
			assertTrue(textField.multiline);
		}

		public function testGet_restrict():void
		{
			// Add your test logic here
			assertEquals(textField.restrict, "A-Z 0-9");
		}

		public function testGet_selectable():void
		{
			// Add your test logic here
			assertTrue(textField.multiline);
		}

		public function testGet_sharpness():void
		{
			// Add your test logic here
			assertEquals(textField.sharpness, 50);
		}

		public function testGet_styleSheet():void
		{
			// Add your test logic here
			assertNotUndefined(textField.styleSheet);
		}

		public function testGet_textColor():void
		{
			// Add your test logic here
			assertEquals(textField.textColor, TypeHelperUtil.stringToUint("red"));
		}

		public function testGet_thickness():void
		{
			// Add your test logic here
			assertEquals(textField.thickness, 100);
		}

		public function testGet_wordWrap():void
		{
			// Add your test logic here
			assertTrue(textField.wordWrap);
		}

		/*** TextFormat Tests ***/

		public function testGet_align():void
		{
			assertEquals(tfx.align, "center");
		}

		public function testGet_blockIndent():void
		{
			assertEquals(tfx.blockIndent, 10);
		}

		public function testGet_bold():void
		{
			// Add your test logic here
			assertTrue(tfx.bold);
		}

		public function testGet_bullet():void
		{
			// Add your test logic here
			assertTrue(tfx.bullet);
		}

		public function testGet_color():void
		{
			// Add your test logic here
			assertEquals(tfx.color, 0xff0000);
		}

		public function testGet_font():void
		{
			// Add your test logic here
			assertEquals(tfx.font, "Times New Roman");
		}

		public function testGet_indent():void
		{
			// Add your test logic here
			assertEquals(tfx.indent, 10);
		}

		public function testGet_italic():void
		{
			// Add your test logic here
			assertTrue(tfx.italic);
		}

		public function testGet_kerning():void
		{
			// Add your test logic here
			assertTrue(tfx.kerning);
		}

		public function testGet_leading():void
		{
			// Add your test logic here
			assertEquals(tfx.leading, 10);
		}

		public function testGet_leftMargin():void
		{
			// Add your test logic here
			assertEquals(tfx.leftMargin, 10);
		}

		public function testGet_letterSpacing():void
		{
			// Add your test logic here
			assertEquals(tfx.letterSpacing, 10);
		}

		public function testGet_rightMargin():void
		{
			// Add your test logic here
			assertEquals(tfx.rightMargin, 10);
		}

		public function testGet_size():void
		{
			// Add your test logic here
			assertEquals(tfx.size, 10);
		}

		/*public function testGet_tabStops():void
		   {
		   // Add your test logic here
		   assertEquals(tfx.tabStops, 10);
		 }*/

		public function testGet_underline():void
		{
			// Add your test logic here
			assertTrue(tfx.kerning);
		}

		public function testNativeStyleSheet():void
		{
			assertEquals(textField.styleSheet.styleNames.length, 1);
		}

	}
}

