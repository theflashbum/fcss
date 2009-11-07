package flexUnitTests
{
	import com.flashartofwar.fcss.styles.Style;
	import com.flashartofwar.fcss.stylesheets.IStyleSheet;
	import com.flashartofwar.fcss.stylesheets.StyleSheet;
	import com.flashartofwar.fcss.stylesheets.StyleSheetCollection;
	import com.flashartofwar.fcss.utils.CSSTidyUtil;

	import flexunit.framework.TestCase;

	public class StyleSheetCollectionTest extends TestCase
	{

		public function StyleSheetCollectionTest(methodName:String = null)
		{
			//TODO: implement function
			super(methodName);
		}

		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef:com.flashartofwar.fcss.stylesheets.StyleSheetCollection;

		private var styleSheetA:StyleSheet;

		private var styleSheetB:StyleSheet;

		private var styleSheetCollection:StyleSheetCollection;

		public function get cssTextA():String
		{
			var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								baseStyle {
										x: 10px;
										y: 10px;
										width: 100px;
										height: 100px;
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
										background-image: url('/images/full_screen_background.jpg');
								}
								
								#fullScreenButton{
										background-color: #FF0000;
										background-image: url('/images/full_screen_background.jpg');
								}
								
								#playButton:over {
										background-color: #333333;
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

			styleSheetCollection = new StyleSheetCollection();
			styleSheetA = new StyleSheet();
			styleSheetA.parseCSS(cssTextA);

			styleSheetB = new StyleSheet();
			styleSheetB.parseCSS(cssTextB);

		}

		public function testAddStyleSheet():void
		{
			var createdSheet:IStyleSheet = styleSheetCollection.addStyleSheet("test", styleSheetA);

			assertNotNull(createdSheet);
		}

		public function testClear():void
		{
			styleSheetCollection.clear();
			assertEquals(styleSheetCollection.totalStyleSheets, 0);
		}

		protected function addBothStyleSheets():void
		{
			styleSheetCollection.addStyleSheet("sheetA", styleSheetA);
			styleSheetCollection.addStyleSheet("sheetB", styleSheetB);	
		}

		public function testGetStyle():void
		{
			addBothStyleSheets();
		}

		public function testStyleToStringFromSheet():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			var output:String = "baseStyle{styleName:baseStyle;x:300;y:10;width:100;height:150;padding:5;margin:0;}";
			assertEquals(style.toString(), output);
		}

		public function testDynamicStyleToString():void
		{

			var style:Style = new Style();
			style.styleName = "propTest";
			style.propA = "a";
			style.propB = "b";
			style.propC = "c";
			var output:String = "propTest{styleName:propTest;propA:a;propB:b;propC:c;}";
			assertEquals(style.toString(), output);
		}

		public function testGetStyleStyleName():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			assertEquals(style.styleName, "baseStyle");
		}

		public function testGetStylePropTestA():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			assertEquals(style.y, "10");
		}

		public function testGetStylePropTestB():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			assertEquals(style.width, "100");
		}

		public function testGetStylePropTestC():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			assertEquals(style.padding, "5");
		}

		public function testGetStylePropTestD():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			assertEquals(style.x, "300");
		}
		public function testGetStyleSheet():void
		{
			styleSheetCollection.addStyleSheet("test", styleSheetA);

			assertNotNull(styleSheetCollection.getStyleSheet("test"));
		}

		public function testGet_styleNames():void
		{
			addBothStyleSheets();
			var styles:Array = styleSheetCollection.styleNames;

			assertEquals(styles.length, 8);
		}

		public function testNewstyle():void
		{
			var style:Style = new Style();
			style.styleName = "Teststyle";

			styleSheetCollection.newStyle("Teststyle", style);
			assertEquals(styleSheetCollection.getStyle("Teststyle").styleName, "Teststyle");


		}

		public function testParseCSS():void
		{
			var tidyCSS:String = CSSTidyUtil.tidy(cssTextA);

			styleSheetCollection.parseCSS(cssTextA);
			var sheet:IStyleSheet = styleSheetCollection.baseStyleSheet;

			assertEquals(sheet.toString(), tidyCSS);
		}

		public function testRemoveStyleSheet():void
		{
			addBothStyleSheets();
			styleSheetCollection.removeStyleSheet("sheetB");

			assertNull(styleSheetCollection.getStyleSheet("sheetB"));
		}

		public function testGetStyleNamesReturnsCleanArray():void
		{
			addBothStyleSheets();

			var styleNames:Array = styleSheetCollection.styleNames;

			styleNames.length = 0;
			assertEquals(styleSheetCollection.styleNames.length, 8);
		}
	}
}

