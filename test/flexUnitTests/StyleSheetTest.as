package flexUnitTests
{
	import com.flashartofwar.fcss.styles.Style;
	import com.flashartofwar.fcss.stylesheets.StyleSheet;
	import com.flashartofwar.fcss.utils.CSSTidyUtil;

	import flexunit.framework.TestCase;

	public class StyleSheetTest extends TestCase
	{

		public function StyleSheetTest(methodName:String = null)
		{
			//TODO: implement function
			super(methodName);
		}

		// Reference declaration for class to test
		private var classToTestRef:com.flashartofwar.fcss.stylesheets.StyleSheet;

		private var sheet:StyleSheet;

		public function get cssTextA():String
		{
			var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								@variables
								{
									defaultColor: #333333;
								}
								
								baseStyle {
										x: 10px;
										y: 10px;
										width: 100px;
										height: 100%;
										padding: 5px;
										margin: 10px;
								}
								
								baseStyle .Button{
										x: 0px;
										y: 0px;
										background-color: #000000;
								}
								
								#playButton {
										background-color: #FFFFFF;
										background-image: url('/images/play_button_background.jpg');
								}
								
								#playButton:over {
										background-color: var(defaultColor);
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
								
								@variables
								{
									test2: FooBar;
								}
								
								baseStyle {
									x: 300px;
									height: 150px;
									margin: 0px;
								}
								
								extraStyle
								{
									debug: true;
								}
				
				
							]]>
				</css>;
			return xml.toString();
		}

		//This method will be called before every test function
		override public function setUp():void
		{
			//TODO: implement function
			super.setUp();


			sheet = new StyleSheet();
			sheet.parseCSS(cssTextA);

		}

		//This method will be called after every test function
		override public function tearDown():void
		{
			super.tearDown();
			sheet = null;
		}

		public function testClear():void
		{
			// Add your test logic here
			sheet.clear();
			assertEquals(sheet.toString(), "");
		}

		public function testClearStyleNames():void
		{
			// Add your test logic here
			sheet.clear();
			assertEquals(sheet.styleNames.length, 0);
		}

		public function testClone():void
		{
			// Add your test logic here
			var clone:StyleSheet = sheet.clone() as StyleSheet;

			assertStrictlyEquals(sheet.toString(), clone.toString());
		}

		public function testGetstyle():void
		{
			var style:Style = sheet.getStyle("#playButton");
			var styleTest:String = style.toString();
			var sampleTest:String = "#playButton{styleName:#playButton;background-color:#FFFFFF;background-image:url('/images/play_button_background.jpg');}";
			assertEquals(style.toString(), sampleTest);
		}

		public function testNewstyle():void
		{
			var prop:Style = new Style();
			prop.styleName = "teststyle";
			prop.x = "10";

			sheet.newStyle("teststyle", prop);

			assertEquals(sheet.getStyle("teststyle").toString(), prop.toString());
		}

		public function testParseCSS():void
		{
			var styles:Array = sheet.styleNames;
			var total:Number = styles.length;
			assertEquals(total, 7);
		}

		public function testSecondCSSParse():void
		{
			praseSecondCSSSheet();
			var styles:Array = sheet.styleNames;
			var total:Number = styles.length;
			assertEquals(total, 8);

		}

		public function testSecondCSSParseStyle():void
		{
			praseSecondCSSSheet();
			var style:Style = sheet.getStyle("baseStyle");
			var styleTest:String = style.toString();
			var sampleTest:String = "baseStyle{styleName:baseStyle;x:300;y:10;width:100;height:150;padding:5;margin:0;}";
			assertEquals(style.toString(), sampleTest);
		}

		public function testToString():void
		{
			assertEquals(sheet.toString(), CSSTidyUtil.tidy(cssTextA));
		}

		protected function praseSecondCSSSheet():void
		{
			sheet.parseCSS(cssTextB);
		}

		public function testRelatedStyle():void
		{
			var totalRelated:int =  sheet.relatedStyle(".SimpleButton").length;
			assertEquals(totalRelated, 2);
		}

		public function testHasStyle():void
		{
			assertTrue(sheet.hasStyle("baseStyle"));
		}

		public function testStyleNamesReturnsCleanArray():void
		{
			var styleNames:Array = sheet.styleNames;
			styleNames.length = 0;

			assertEquals(sheet.styleNames.length, 7);
		}

		public function testVaribleMerge():void
		{
			sheet.parseCSS(cssTextB);
			assertEquals(sheet.getStyle("@variables").toString(), "@variables{styleName:@variables;defaultColor:#333333;test2:FooBar;}");
		}

		public function testVariableReplace():void
		{
			var style:Style = sheet.getStyle("#playButton:over");
			assertEquals( style.toString(), "#playButton:over{styleName:#playButton:over;background-color:#333333;background-image:url('/images/play_button_background.jpg');}");
		}

		public function testNumberOfStylesAfterRequestingAllStyles():void
		{
			var i:int;
			var style:Style;
			var styles:Array = sheet.styleNames;
			var total:Number = styles.length;

			for(i = 0; i < total; i++)
			{
				style = sheet.getStyle(sheet.styleNames[i]);
			}
			assertEquals(sheet.styleNames.length, total);

		}
	}
}

