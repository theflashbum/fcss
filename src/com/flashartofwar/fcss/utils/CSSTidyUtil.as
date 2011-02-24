/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: CSSTidyUtil.as</p>
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

package com.flashartofwar.fcss.utils
{

    /**
     * <p>CSSTidyUtil uses regex to remove spaces, breaks, "px" and other items
     * that the F*CSS's parser doesn't know how to handle. This also shrinks
     * the CSS filesize substatually to help speed up parsing.</p>
     *
     * <p>In most cases it is better to do this on the server then in Flash at
     * run time. You can simply take this regex and run it through php or some
     * other server side language.</p>
     *
     * @author jessefreeman
     */
    public class CSSTidyUtil
    {

        protected static const COMPRESS_CSS:RegExp = /\s*([@{}:;,]|\)\s|\s\()\s*|\/\*([^*\\\\]|\*(?!\/))+\*\/|[\n\r\t]/g;

        /**
         * <p>This uses regex to remove spaces, breaks, "px" and other items
         * that the F*CSS's parser doesn't know how to handle and returns a clean
         * string.</p>
         *
         * @param cssText
         * @return
         */
        public static function tidy(cssText:String):String
        {
            return cssText.replace(COMPRESS_CSS, "$1");
        }

        /**
         * <p>Returns given lowercaseandunderscoreword as a camelCased word.</p>
         *
         * @param string lowercaseandunderscoreword Word to camelize
         * @return string Camelized word. likeThis.
         */
        public static function camelize(lowercaseandunderscoreword:String, deimiter:String = "-"):String
        {
            var tarray:Array = lowercaseandunderscoreword.split(deimiter);

            for (var i:int = 1; i < tarray.length; i++)
            {
                tarray[i] = ucfirst(tarray[i] as String);
            }
            var replace:String = tarray.join("");
            return replace;
        }

        /**
         * <p>Make first character of word upper case</p>
         * @param    word
         * @return string
         */
        public static function ucfirst(word:String):String
        {
            return word.substr(0, 1).toUpperCase() + word.substr(1);
        }
    }
}

