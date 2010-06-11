/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: ColorsByName.as</p>
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

    /**
     * @author jessefreeman
     */
    public class ColorsByName
    {
        /**
         * <p>Looks up the property type and confirms that it exists.</p>
         *
         * @param property
         */
        public static function isSupported(colorName:String):Boolean
        {
            return (COLORS.hasOwnProperty(colorName));
        }

        /**
         *
         * @param name
         * @param value
         */
        public static function convertColor(colorName:String):uint
        {
            return COLORS.hasOwnProperty(colorName) ? COLORS[colorName] : 0x000000;
        }

        public static function registerColor(name:String, color:uint):void
        {
            COLORS[name] = color;
        }

        public static function removeColor(name:String):void
        {
            delete COLORS[name];
        }

        private static const COLORS:Object = new Object();
        {
            COLORS["black"] = 0x000000;
            COLORS["blue"] = 0x0000FF;
            COLORS["green"] = 0x008000;
            COLORS["gray"] = 0x808080;
            COLORS["silver"] = 0xC0C0C0;
            COLORS["lime"] = 0x00FF00;
            COLORS["olive"] = 0x808000;
            COLORS["white"] = 0xFFFFFF;
            COLORS["yellow"] = 0xFFFF00;
            COLORS["maroon"] = 0x800000;
            COLORS["navy"] = 0x000080;
            COLORS["red"] = 0xFF0000;
            COLORS["purple"] = 0x800080;
            COLORS["teal"] = 0x008080;
            COLORS["fuchsia"] = 0xFF00FF;
            COLORS["aqua"] = 0x00FFFF;
            COLORS["magenta"] = 0xFF00FF;
            COLORS["cyan"] = 0x00FFFF;
        }


    }
}

