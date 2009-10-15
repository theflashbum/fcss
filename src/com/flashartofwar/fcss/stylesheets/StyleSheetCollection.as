
/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: StyleSheetCollection.as</p>
 *
 * <p>Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:</p>
 *
 * <p>The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.</p>
 *
 * <p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.</p>
 *
 * <p>Licensed under The MIT License</p>
 * <p>Redistributions of files must retain the above copyright notice.</p>
 *
 * <p>Revisions<br/>
 *		1.0  Initial version Aug 28, 2009</p>
 *
 */

package com.flashartofwar.fcss.stylesheets
{
	import com.flashartofwar.fcss.styles.IStyle;
	import com.flashartofwar.fcss.styles.Style;

	/**
	 * @author jessefreeman
	 */
	public class StyleSheetCollection implements IStyleSheet
	{

		/**
		 *
		 * @param enforcer
		 *
		 */
		public function StyleSheetCollection()
		{

		}

		protected var defaultSheetName:String = "StyleSheet";

		protected var styleSheets:Array = [];

		private var _totalSheets:Number = 0;

		/**
		 *
		 * @param id
		 * @param sheet
		 *
		 */
		public function addStyleSheet(id:String, sheet:IStyleSheet):IStyleSheet
		{
			styleSheets[id] = sheet;
			_totalSheets++;
			return styleSheets[id];
		}


		/**
		 *
		 * @return
		 */
		public function get baseStyleSheet():StyleSheet
		{
			return styleSheets[defaultSheetName+1];
		}

		/**
		 *
		 */
		public function clear():void
		{
			styleSheets.length = 0;
			_totalSheets = 0;
		}

		/**
		 *
		 * @param selectorName
		 * @return
		 *
		 */
		public function getSelector(... selectorNames):IStyle
		{
			var tempProperties:IStyle = new Style();

			for each (var styleSheet:IStyleSheet in styleSheets)
			{
				var sheetProperties:IStyle = styleSheet.getSelector.apply(null, selectorNames);
				if (sheetProperties.selectorName != "EmptyProperties")
					tempProperties.merge(sheetProperties);
			}

			return tempProperties;
		}

		/**
		 *
		 * @param id
		 */
		public function getStyleSheet(id:String):IStyleSheet
		{
			return styleSheets[id];
		}

		public function hasSelector(name:String):Boolean
		{
			return false;
		}

		/**
		 *
		 * @param selectorName
		 * @param propertySelector
		 */
		public function newSelector(name:String, selector:IStyle):void
		{
			if (baseStyleSheet)
				IStyleSheet(baseStyleSheet).newSelector(name, selector);
		}

		/**
		 *
		 * @param CSSText
		 * @param compressText
		 */
		public function parseCSS(CSSText:String, compressText:Boolean = true):void
		{
			var styleSheet:StyleSheet = new StyleSheet();
			styleSheet.parseCSS(CSSText, compressText);

			addStyleSheet(defaultSheetName + (totalSheets + 1), styleSheet);
		}

		public function relatedSelectors(name:String):Array
		{
			return new Array();
		}

		/**
		 *
		 * @param id
		 *
		 */
		public function removeStyleSheet(id:String):IStyleSheet
		{
			var styleSheet:StyleSheet = styleSheets[id];
			delete styleSheets[id];
			_totalSheets--;
			return styleSheet;

		}

		/**
		 *
		 * @return
		 */
		public function get selectorNames():Array
		{
			var selectorNames:Array = new Array();

			var styleSheet:IStyleSheet;
			for each (styleSheet in styleSheets)
			{
				//TODO need to finish this method.
			}
			return selectorNames;
		}

		public function get totalSheets():Number
		{
			return _totalSheets;
		}

		public function toString():String
		{
			return styleSheets.join();
		}
	}
}

