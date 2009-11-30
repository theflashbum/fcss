package com.flashartofwar.fcss.stylesheets
{
	import com.flashartofwar.fcss.styles.IStyle;
	
	import org.flexunit.Assert;

	public class StyleSheetCollectionMultipleStyleSheetMergeTest extends StyleSheetCollection
	{
		private var styleSheetA : FStyleSheet;
		private var styleSheetB : FStyleSheet;
		
		public function StyleSheetCollectionMultipleStyleSheetMergeTest()
		{
			super();
		}

		public function get cssTextA():String
		{
			var xml:XML=<css><![CDATA[/* This is a comment in the CSS file */
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
			var xml:XML=<css><![CDATA[/* This is a comment in the CSS file */
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
							]]>
				</css>;
			return xml.toString();
		}
		
		[Before]
		
		public function runBeforeEveryTest() : void 
		{
			styleSheetA = new FStyleSheet();
			styleSheetA.parseCSS(cssTextA);
			addStyleSheet("test", styleSheetA);
			
			
			styleSheetB = new FStyleSheet();
			styleSheetB.parseCSS(cssTextB);
		}
		
		[After]
		
		public function runAfterEveryTest() : void 
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
			Assert.assertEquals(related.join(),"baseStyle,interactive"); 
		}
		
		[Test]
		public function testRequestStyleRelatedSelectorsFromSheetAAndB():void
		{
			addStyleSheet("test2", styleSheetB);
			var related:Array = relatedStyles(".SimpleButton");
			Assert.assertEquals(related.join(),"baseStyle,interactive,border"); 
		}
		
		[Test]
		public function testGetUnmergedStyleFromSingleSheet():void
		{
			var output:String = ".SimpleButton{styleName:.SimpleButton;width:75px;height:30;}";
			var style:IStyle = styleLookup(".SimpleButton", false);
			Assert.assertEquals(style.toString(), output);

		}

	}
}