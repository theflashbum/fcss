package flexUnitTests
{
	import com.flashartofwar.fcss.factories.TextFieldFactory;
	import com.flashartofwar.fcss.managers.StyleSheetManager;
	import com.flashartofwar.fcss.utils.TextFieldUtil;
	import com.flashartofwar.fcss.utils.TypeHelperUtil;

	import flash.text.TextField;
	import flash.text.TextFormat;

	import flexunit.framework.TestCase;

	public class TextFieldFactoryTest extends TestCase
	{
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef : com.flashartofwar.fcss.utils.TextFieldUtil;
		private var textField:TextField;
		private var tfx:TextFormat;

		public function TextFieldFactoryTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
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
		override public function setUp():void
		{
			//TODO: implement function
			super.setUp();

			StyleSheetManager.instance.parseCSS(cssText);

			var tff:TextFieldFactory = new TextFieldFactory();

			textField = tff.createTextField("DemoTextField");
			textField.htmlText = "Hello World!";

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

		public function testGet_underline():void
		{
			// Add your test logic here
			assertTrue(tfx.kerning);
		}

		public function testHTMLText():void
		{
			// Add your test logic here
			assertEquals(textField.htmlText, 'Hello World!');
		}

		public function testNativeStyleSheet():void
		{
			assertEquals(textField.styleSheet.styleNames.length, 1);
		}

	}
}

