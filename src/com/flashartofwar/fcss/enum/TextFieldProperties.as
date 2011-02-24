/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: TextFieldProperties.as</p>
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
 *        1.0.0  Initial version Feb 11, 2010</p>
 *
 */

package com.flashartofwar.fcss.enum
{
    import com.flashartofwar.fcss.utils.TypeHelperUtil;

    /**
     * @author jessefreeman
     */
    public class TextFieldProperties
    {
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
        public static function cleanupProp(id:String, value:String):*
        {
            return TypeHelperUtil.getType(value, PROPERTY_TYPES[id]);
        }

        private static const PROPERTY_TYPES:Object = new Object();
        {
            PROPERTY_TYPES[CSSProperties.ALWAYS_SHOW_SELECTION] = "boolean";
            PROPERTY_TYPES[CSSProperties.ANTI_ALIAS_TYPE] = "string";
            PROPERTY_TYPES[CSSProperties.AUTO_SIZE] = "string"; // Values none, left, center, right
            PROPERTY_TYPES[CSSProperties.BACKGROUND] = "boolean";
            PROPERTY_TYPES[CSSProperties.BACKGROUND_COLOR] = "uint";
            PROPERTY_TYPES[CSSProperties.BORDER] = "boolean";
            PROPERTY_TYPES[CSSProperties.BORDER_COLOR] = "uint";
            PROPERTY_TYPES[CSSProperties.CONDENSE_WHITE] = "boolean";
            PROPERTY_TYPES[CSSProperties.DISPLAY_AS_PASSWORD] = "boolean";
            PROPERTY_TYPES[CSSProperties.EMBED_FONTS] = "boolean";
            PROPERTY_TYPES[CSSProperties.GRID_FIT_TYPE] = "boolean";
            PROPERTY_TYPES[CSSProperties.MAX_CHARS] = "number";
            PROPERTY_TYPES[CSSProperties.MOUSE_WHEEL_ENABLED] = "boolean";
            PROPERTY_TYPES[CSSProperties.MULTILINE] = "boolean";
            PROPERTY_TYPES[CSSProperties.RESTRICT] = "string";
            PROPERTY_TYPES[CSSProperties.SELECTABLE] = "boolean";
            PROPERTY_TYPES[CSSProperties.SHARPNESS] = "number";
            PROPERTY_TYPES[CSSProperties.TEXT_COLOR] = "uint";
            PROPERTY_TYPES[CSSProperties.THICKNESS] = "number";
            PROPERTY_TYPES[CSSProperties.WORD_WRAP] = "boolean";
            PROPERTY_TYPES[CSSProperties.WIDTH] = "number";
            PROPERTY_TYPES[CSSProperties.HEIGHT] = "number";
            PROPERTY_TYPES[CSSProperties.ALPHA] = "number";
            PROPERTY_TYPES[CSSProperties.X] = "number";
            PROPERTY_TYPES[CSSProperties.Y] = "number";
            PROPERTY_TYPES[CSSProperties.ROTATION] = "number";
        }


    }
}

