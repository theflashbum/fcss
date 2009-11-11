package com.flashartofwar.fcss.stylesheets
{
	import com.flashartofwar.fcss.styles.Style;
	import com.flashartofwar.fcss.utils.CSSTidyUtil;
	
	import flexunit.framework.Assert;

	public class StyleSheetCollectionTest
	{


		private var styleSheetA:StyleSheet;

		private var styleSheetB:StyleSheet;

		private var styleSheetCollection:StyleSheetCollection;

		public function StyleSheetCollectionTest()
		{
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
								
								baseStyle .Button{
										x: 0;
										y: 0;
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
									margin: 0;
								}
								
								extraStyle
								{
									debug: true;
								}
							]]>
				</css>;
			return xml.toString();
		}

		[Before(ui)]
		public function runBeforeEachTest():void
		{

			styleSheetCollection = new StyleSheetCollection();
			styleSheetA = new StyleSheet();
			styleSheetA.parseCSS(cssTextA);

			styleSheetB = new StyleSheet();
			styleSheetB.parseCSS(cssTextB);

		}
		
		[Test]
		public function testAddStyleSheet():void
		{
			var createdSheet:IStyleSheet = styleSheetCollection.addStyleSheet("test", styleSheetA);

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
			styleSheetCollection.addStyleSheet("sheetA", styleSheetA);
			styleSheetCollection.addStyleSheet("sheetB", styleSheetB);
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
			
			var style:Style = styleSheetCollection.getStyle("baseStyle");
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

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			Assert.assertEquals(style.styleName, "baseStyle");
		}
		
		[Test]
		public function testGetStylePropTestA():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			Assert.assertEquals(style.y, "10");
		}
		
		[Test]
		public function testGetStylePropTestB():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			Assert.assertEquals(style.width, "100");
		}
		
		[Test]
		public function testGetStylePropTestC():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			Assert.assertEquals(style.padding, "5");
		}
		
		[Test]
		public function testGetStylePropTestD():void
		{
			addBothStyleSheets();

			var style:Style = styleSheetCollection.getStyle("baseStyle");
			Assert.assertEquals(style.x, "300px");
		}
		
		[Test]
		public function testGetStyleSheet():void
		{
			styleSheetCollection.addStyleSheet("test", styleSheetA);

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
	}
}

