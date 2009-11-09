package com.flashartofwar.fcss.stylesheets
{
	import com.flashartofwar.fcss.styles.Style;
	import com.flashartofwar.fcss.utils.CSSTidyUtil;
	
	import flexunit.framework.Assert;

	public class StyleSheetTest
	{

		private var sheet:StyleSheet;

		public function StyleSheetTest()
		{
		}

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

		[Before(ui)]
		public function runBeforeEachTest():void
		{

			sheet = new StyleSheet();
			sheet.parseCSS(cssTextA);

		}

		[After(ui)]
		public function runAfterEachTest():void
		{
			sheet = null;
		}
		
		[Test]
		public function testClear():void
		{
			// Add your test logic here
			sheet.clear();
			Assert.assertEquals(sheet.toString(), "");
		}
		
		[Test]
		public function testClearStyleNames():void
		{
			// Add your test logic here
			sheet.clear();
			Assert.assertEquals(sheet.styleNames.length, 0);
		}
		
		[Test]
		public function testClone():void
		{
			// Add your test logic here
			var clone:StyleSheet = sheet.clone() as StyleSheet;

			Assert.assertStrictlyEquals(sheet.toString(), clone.toString());
		}
		
		[Test]
		public function testGetstyle():void
		{
			var style:Style = sheet.getStyle("#playButton");
			var styleTest:String = style.toString();
			var sampleTest:String = "#playButton{styleName:#playButton;background-color:#FFFFFF;background-image:url('/images/play_button_background.jpg');}";
			Assert.assertEquals(style.toString(), sampleTest);
		}
		
		[Test]
		public function testNewstyle():void
		{
			var prop:Style = new Style();
			prop.styleName = "teststyle";
			prop.x = "10";

			sheet.newStyle("teststyle", prop);

			Assert.assertEquals(sheet.getStyle("teststyle").toString(), prop.toString());
		}
		
		[Test]
		public function testParseCSS():void
		{
			var styles:Array = sheet.styleNames;
			var total:Number = styles.length;
			Assert.assertEquals(total, 7);
		}
		
		[Test]
		public function testSecondCSSParse():void
		{
			praseSecondCSSSheet();
			var styles:Array = sheet.styleNames;
			var total:Number = styles.length;
			Assert.assertEquals(total, 8);

		}
		
		[Test]
		public function testSecondCSSParseStyle():void
		{
			praseSecondCSSSheet();
			var style:Style = sheet.getStyle("baseStyle");
			var styleTest:String = style.toString();
			var sampleTest:String = "baseStyle{styleName:baseStyle;x:300;y:10;width:100;height:150;padding:5;margin:0;}";
			Assert.assertEquals(style.toString(), sampleTest);
		}
		
		[Test]
		public function testToString():void
		{
			Assert.assertEquals(sheet.toString(), CSSTidyUtil.tidy(cssTextA));
		}
		
		[Test]
		protected function praseSecondCSSSheet():void
		{
			sheet.parseCSS(cssTextB);
		}
		
		[Test]
		public function testRelatedStyle():void
		{
			var totalRelated:int =  sheet.relatedStyle(".SimpleButton").length;
			Assert.assertEquals(totalRelated, 2);
		}
		
		[Test]
		public function testHasStyle():void
		{
			Assert.assertTrue(sheet.hasStyle("baseStyle"));
		}
		
		[Test]
		public function testStyleNamesReturnsCleanArray():void
		{
			var styleNames:Array = sheet.styleNames;
			styleNames.length = 0;

			Assert.assertEquals(sheet.styleNames.length, 7);
		}
		
		[Test]
		public function testVaribleMerge():void
		{
			sheet.parseCSS(cssTextB);
			Assert.assertEquals(sheet.getStyle("@variables").toString(), "@variables{styleName:@variables;defaultColor:#333333;test2:FooBar;}");
		}
		
		[Test]
		public function testVariableReplace():void
		{
			var style:Style = sheet.getStyle("#playButton:over");
			Assert.assertEquals( style.toString(), "#playButton:over{styleName:#playButton:over;background-color:#333333;background-image:url('/images/play_button_background.jpg');}");
		}
		
		[Test]
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
			Assert.assertEquals(sheet.styleNames.length, total);

		}
	}
}

