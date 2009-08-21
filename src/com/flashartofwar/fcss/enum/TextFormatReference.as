/** 
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: TextFormatReference.as</p>
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
 *      2.0  Initial version Jan 7, 2009</p>
 *
 */

package com.flashartofwar.fcss.enum {
	import com.flashartofwar.fcss.utils.TypeHelperUtil;

	public class TextFormatReference {

		public static const ALIGN : String = "align";
		public static const TEXT_ALIGN : String = "textAlign";
		public static const BLOCK_INDENT : String = "blockIndent";
		public static const BOLD : String = "bold";
		public static const BULLET : String = "bullet";
		public static const COLOR : String = "color";
		public static const FONT : String = "font";
		public static const FONT_FACE : String = "fontFace";
		public static const INDENT : String = "indent";
		public static const ITALIC : String = "italic";
		public static const KERNING : String = "kerning";
		public static const LEADING : String = "leading";
		public static const LEFT_MARGIN : String = "leftMargin";
		public static const MARGIN_LEFT : String = "marginLeft";
		public static const LETTER_SPACING : String = "letterSpacing";
		public static const RIGHT_MARGIN : String = "rightMargin";
		public static const MARGIN_RIGHT : String = "marginRight";
		public static const SIZE : String = "size";
		public static const FONT_SIZE : String = "fontSize";
		public static const TAB_STOPS : String = "tabStops";
		public static const TARGET : String = "target";
		public static const UNDERLINE : String = "underline";

		private static const PROPERTY_TYPES : Object = new Object();
		{
		PROPERTY_TYPES[ALIGN] = "string";
		PROPERTY_TYPES[BLOCK_INDENT] = "boolean";
		PROPERTY_TYPES[BOLD] = "boolean";
		PROPERTY_TYPES[BULLET] = "boolean";
		PROPERTY_TYPES[COLOR] = "color";
		PROPERTY_TYPES[FONT] = "string";
		PROPERTY_TYPES[INDENT] = "number";
		PROPERTY_TYPES[ITALIC] = "boolean";
		PROPERTY_TYPES[KERNING] = "number";
		PROPERTY_TYPES[LEADING] = "number";
		PROPERTY_TYPES[LEFT_MARGIN] = "number";
		PROPERTY_TYPES[LETTER_SPACING] = "number";
		PROPERTY_TYPES[RIGHT_MARGIN] = "number";
		PROPERTY_TYPES[SIZE] = "number";
		PROPERTY_TYPES[TAB_STOPS] = "number";
		PROPERTY_TYPES[TARGET] = "string";
		PROPERTY_TYPES[UNDERLINE] = "boolean";
		}

		private static const PROPERTY_MAP : Object = new Object;
		{
		PROPERTY_MAP[FONT_FACE] = FONT;
		PROPERTY_MAP[TEXT_ALIGN] = ALIGN;
		PROPERTY_MAP[MARGIN_LEFT] = LEFT_MARGIN;
		PROPERTY_MAP[MARGIN_RIGHT] = RIGHT_MARGIN;
		PROPERTY_MAP[FONT_SIZE] = SIZE;
		}

		public static function isSupported(property : String) : Boolean {
			return (PROPERTY_TYPES[convertProp(property)]);
		}

		public static function cleanupProp(id : String,value : String) : * {
			return TypeHelperUtil.getType(value, PROPERTY_TYPES[convertProp(id)]);
		}

		public static function convertProp(prop : String) : String {
			return (PROPERTY_MAP[prop]) ? PROPERTY_MAP[prop] : prop;
		}
	}
}