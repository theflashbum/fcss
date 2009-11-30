package com.flashartofwar.fcss.stylesheets
{
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
			parseCSS(cssTextA);
		}
		
		private function parseSheetB():void
		{
			parseCSS(cssTextB);
		}
		
		[After]
		
		public function runAfterEveryTest() : void 
		{
			clear(); 
		}
		
		[Test]
		public function requestStyleRelatedSelectorsFromSheetSingleSheet():void
		{
			Assert.fail("This is not implemented yet");
			var related:Array = relatedStyles(".SimpleButton");
			Assert.assertEquals(related.join(),"baseStyle,interactive"); 
		}

	}
}