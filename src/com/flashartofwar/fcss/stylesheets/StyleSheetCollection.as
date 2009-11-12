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
	public class StyleSheetCollection implements IStyleSheetCollection
	{

		public static const baseStyleSheetName : String = "StyleSheet1";
		public static const defaultSheetName : String = "StyleSheet";
		protected var styleSheets : Array = [];
		protected var _totalSheets : Number = 0;
		protected var _name : String;

		/**
		 *
		 * @param enforcer
		 *
		 */
		public function StyleSheetCollection()
		{
		}

		/**
		 *
		 * @param id
		 * @param sheet
		 *
		 */
		public function addStyleSheet(id : String, sheet : IStyleSheet) : IStyleSheet
		{
			styleSheets[id] = sheet;
			_totalSheets ++;
			return styleSheets[id];
		}

		/**
		 *
		 * @return
		 */
		public function get baseStyleSheet() : IStyleSheet
		{
			if (! styleSheets[baseStyleSheetName])
				addStyleSheet(baseStyleSheetName, new FStyleSheet());

			return styleSheets[baseStyleSheetName];
		}

		/**
		 *
		 */
		public function clear() : void
		{
			styleSheets.length = 0;
			_totalSheets = 0;
		}

		/**
		 *
		 * @param styleName
		 * @return
		 *
		 */
		public function getStyle(... styleNames) : IStyle
		{
			var tempProperties : IStyle = createEmptyStyle();

			for each (var styleSheet:IStyleSheet in styleSheets)
			{
				var sheetProperties : IStyle = styleSheet.getStyle.apply(null, styleNames);
				if (sheetProperties.styleName != "EmptyProperties")
					tempProperties.merge(sheetProperties);
			}

			return tempProperties;
		}
		
		protected function createEmptyStyle() : IStyle
		{
			return new Style() as IStyle;
		}

		/**
		 *
		 * @param id
		 */
		public function getStyleSheet(id : String) : IStyleSheet
		{
			return styleSheets[id];
		}

		/**
		 *
		 * @param name
		 * @return
		 */
		public function hasStyle(name : String) : Boolean
		{
			return false;
		}

		/**
		 *
		 * @param styleName
		 * @param propertystyle
		 */
		public function newStyle(name : String, style : IStyle) : void
		{
			baseStyleSheet.newStyle(name, style);
		}

		/**
		 *
		 * @param CSSText
		 * @param compressText
		 */
		public function parseCSS(CSSText : String, compressText : Boolean = true) : IStyleSheet
		{
			var styleSheet : FStyleSheet = new FStyleSheet();
			styleSheet.parseCSS(CSSText, compressText);
			styleSheet.name = defaultSheetName + (totalStyleSheets + 1);
			addStyleSheet(styleSheet.name, styleSheet);
			return styleSheet;
		}

		/**
		 *
		 * @param name
		 * @return
		 */
		public function relatedStyle(name : String) : Array
		{
			//TODO This is not implemented
			return new Array();
		}

		/**
		 *
		 * @param id
		 *
		 */
		public function removeStyleSheet(id : String) : IStyleSheet
		{
			var styleSheet : FStyleSheet = styleSheets[id];
			delete styleSheets[id];
			_totalSheets --;
			return styleSheet;
		}

		/**
		 *
		 * @return
		 */
		public function get styleNames() : Array
		{
			var styleNames : Array = [];

			var styleSheet : IStyleSheet;
			var styles : Array;
			var total : int;
			var i : int;
			var styleName : String;

			//TODO this may need to be optimized a lot more
			for each (styleSheet in styleSheets)
			{
				styles = styleSheet.styleNames;
				total = styles.length;

				for(i = 0;i < total;i ++)
				{
					styleName = styles[i];
					if (styleNames.indexOf(styleName) == - 1)
						styleNames.push(styleName);
				}
			}
			return styleNames;
		}

		/**
		 *
		 * @return
		 */
		public function toString() : String
		{
			return styleSheets.join();
		}

		/**
		 *
		 * @return
		 */
		public function get totalStyleSheets() : Number
		{
			return _totalSheets;
		}

		public function get name() : String
		{
			return _name;
		}

		public function set name(name : String) : void
		{
			_name = name;
		}
	}
}

