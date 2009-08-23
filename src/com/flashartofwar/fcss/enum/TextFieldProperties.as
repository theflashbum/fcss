/** 
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: TextFieldReference.as</p>
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

	public class TextFieldProperties 
        {

                public static const ALWAYS_SHOW_SELECTION:String = "alwaysShowSelection";
                public static const ANTI_ALIAS_TYPE:String = "antiAliasType";
                public static const AUTO_SIZE:String = "autoSize";
                public static const BACKGROUND:String = "background";
                public static const BACKGROUND_COLOR:String = "backgroundColor";
                public static const BORDER:String = "border";
                public static const BORDER_COLOR:String = "borderColor";
                public static const CONDENSE_WHITE:String = "condenseWhite";
                public static const DISPLAY_AS_PASSWORD:String = "displayAsPassword";
                public static const EMBED_FONTS:String = "embedFonts";
                public static const GRID_FIT_TYPE:String = "gridFitType";
                public static const MAX_CHARS:String = "maxChars";
                public static const MOUSE_WHEEL_ENABLED:String = "mouseWheelEnabled";
                public static const MULTILINE:String = "multiline";
                public static const RESTRICT:String = "restrict";
                public static const SELECTABLE:String = "selectable";
                public static const SELECTION_BEGIN_INDEX:String = "selectionBeginIndex";
                public static const SELECTIOEND_INDEX:String = "selectioendIndex";
                public static const SHARPNESS:String = "sharpness";
                public static const TEXT_COLOR:String = "textColor";
                public static const TEXT_HEIGHT:String = "textHeight";
                public static const TEXT_WIDTH:String = "textWidth";
                public static const THICKNESS:String = "thickness";
                public static const WORD_WRAP:String = "wordWrap";
                public static const WIDTH:String = "width";
                public static const HEIGHT:String = "height";
                public static const ALPHA:String = "alpha";
                public static const X:String = "x";
                public static const Y:String = "y";
                
                private static const PROPERTY_TYPES:Object = new Object();
                {
                    PROPERTY_TYPES[ALWAYS_SHOW_SELECTION] = "boolean";
                        PROPERTY_TYPES[ANTI_ALIAS_TYPE] = "string";
                        PROPERTY_TYPES[AUTO_SIZE] = "string"; // Values none, left, center, right
                        PROPERTY_TYPES[BACKGROUND] = "boolean";
                        PROPERTY_TYPES[BACKGROUND_COLOR] = "uint";
                        PROPERTY_TYPES[BORDER] = "boolean";
                        PROPERTY_TYPES[BORDER_COLOR] = "uint";
                        PROPERTY_TYPES[CONDENSE_WHITE] = "boolean";
                        PROPERTY_TYPES[DISPLAY_AS_PASSWORD] = "boolean";
                        PROPERTY_TYPES[EMBED_FONTS] = "boolean";
                        PROPERTY_TYPES[GRID_FIT_TYPE] = true;
                        PROPERTY_TYPES[MAX_CHARS] = "number";
                        PROPERTY_TYPES[MOUSE_WHEEL_ENABLED] = "boolean";
                        PROPERTY_TYPES[MULTILINE] = "boolean";
                        PROPERTY_TYPES[RESTRICT] = true;
                        PROPERTY_TYPES[SELECTABLE] = "boolean";
                        PROPERTY_TYPES[SELECTION_BEGIN_INDEX] = true;
                        PROPERTY_TYPES[SELECTIOEND_INDEX] = true;
                        PROPERTY_TYPES[SHARPNESS] = "number";
                        PROPERTY_TYPES[TEXT_COLOR] = "uint";
                        PROPERTY_TYPES[TEXT_HEIGHT] = "number";
                        PROPERTY_TYPES[TEXT_WIDTH] = "number";
                        PROPERTY_TYPES[THICKNESS] = "number";
                        PROPERTY_TYPES[WORD_WRAP] = "boolean";
                        PROPERTY_TYPES[WIDTH] = "number";
                        PROPERTY_TYPES[HEIGHT] = "number";
                        PROPERTY_TYPES[ALPHA] = "number";
                        PROPERTY_TYPES[X] = "number";
                        PROPERTY_TYPES[Y] = "number";
                 }
                 
                /**
                 * <p>Looks up the property type and confirms that it exists.</p>
                 * 
                 * @param property
                 */ 
                public static function isSupported(property:String):Boolean 
                {
                     return (PROPERTY_TYPES[property]);
                }
                 
                /**
                 * <p>Take a supplied property, and it value then returns the value in it's native type.
                 * This helps convert any string value into a usable property to build a TextField from.</p>
                 * 
                 * @param name
                 * @param value
                 */
                public static function cleanupProp(id:String,value:String):*
                {
                        return TypeHelperUtil.getType(value, PROPERTY_TYPES[id]);
                }
                 
        }
}