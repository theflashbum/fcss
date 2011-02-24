/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: TextFormatProperties.as</p>
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
    public class TextFormatProperties
    {

        /**
         *
         * @param property
         * @return
         */
        public static function isSupported(property:String):Boolean
        {
            return (PROPERTY_TYPES[convertProp(property)]);
        }

        /**
         *
         * @param id
         * @param value
         * @return
         */
        public static function cleanupProp(id:String, value:String):*
        {
            return TypeHelperUtil.getType(value, PROPERTY_TYPES[convertProp(id)]);
        }

        /**
         *
         * @param prop
         * @return
         */
        public static function convertProp(prop:String):String
        {
            return (PROPERTY_MAP[prop]) ? PROPERTY_MAP[prop] : prop;
        }

        private static const PROPERTY_TYPES:Object = new Object();
        {
            PROPERTY_TYPES[CSSProperties.ALIGN] = "string";
            PROPERTY_TYPES[CSSProperties.BLOCK_INDENT] = "number";
            PROPERTY_TYPES[CSSProperties.BOLD] = "boolean";
            PROPERTY_TYPES[CSSProperties.BULLET] = "boolean";
            PROPERTY_TYPES[CSSProperties.COLOR] = "uint";
            PROPERTY_TYPES[CSSProperties.FONT] = "string";
            PROPERTY_TYPES[CSSProperties.INDENT] = "number";
            PROPERTY_TYPES[CSSProperties.ITALIC] = "boolean";
            PROPERTY_TYPES[CSSProperties.KERNING] = "boolean";
            PROPERTY_TYPES[CSSProperties.LEADING] = "number";
            PROPERTY_TYPES[CSSProperties.LEFT_MARGIN] = "number";
            PROPERTY_TYPES[CSSProperties.LETTER_SPACING] = "number";
            PROPERTY_TYPES[CSSProperties.RIGHT_MARGIN] = "number";
            PROPERTY_TYPES[CSSProperties.SIZE] = "number";
            PROPERTY_TYPES[CSSProperties.UNDERLINE] = "boolean";
        }

        private static const PROPERTY_MAP:Object = new Object;
        {
            PROPERTY_MAP[CSSProperties.FONT_FACE] = CSSProperties.FONT;
            PROPERTY_MAP[CSSProperties.TEXT_ALIGN] = CSSProperties.ALIGN;
            PROPERTY_MAP[CSSProperties.MARGIN_LEFT] = CSSProperties.LEFT_MARGIN;
            PROPERTY_MAP[CSSProperties.MARGIN_RIGHT] = CSSProperties.RIGHT_MARGIN;
            PROPERTY_MAP[CSSProperties.FONT_SIZE] = CSSProperties.SIZE;
        }


    }
}

