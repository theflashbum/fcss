/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: TypeHelperUtil.as</p>
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
 * <p>The TypeHelper converts strings into native typed values. This
 *    is useful when getting property values from XML or url request
 *    and doing converting on the fly.</p>
 *
 * <p>Revisions<br/>
 *        1.0.0  Initial version Feb 11, 2010</p>
 *
 */

package com.flashartofwar.fcss.utils
{
    import com.flashartofwar.fcss.typer.Types;
    import com.flashartofwar.fcss.typer.stringToArray;
    import com.flashartofwar.fcss.typer.stringToBoolean;
    import com.flashartofwar.fcss.typer.stringToDictionary;
    import com.flashartofwar.fcss.typer.stringToNumber;
    import com.flashartofwar.fcss.typer.stringToObject;
    import com.flashartofwar.fcss.typer.stringToPoint;
    import com.flashartofwar.fcss.typer.stringToRectangle;
    import com.flashartofwar.fcss.typer.stringToStyleSheet;
    import com.flashartofwar.fcss.typer.stringToUint;
    import com.flashartofwar.fcss.typer.stringToUrlRequest;

    public class TypeHelperUtil
    {
        /**
         *
         */
        private static const FUNCTION_MAP:Object = new Object();
        {
            FUNCTION_MAP[Types.NUMBER] = stringToNumber;
            FUNCTION_MAP[Types.BOOLEAN] = stringToBoolean;
            FUNCTION_MAP[Types.ARRAY] = stringToArray;
            FUNCTION_MAP[Types.DICTIONARY] = stringToDictionary;
            FUNCTION_MAP[Types.OBJECT] = stringToObject;
            FUNCTION_MAP[Types.UINT] = stringToUint;
            FUNCTION_MAP[Types.RECTANGLE] = stringToRectangle;
            FUNCTION_MAP[Types.POINT] = stringToPoint;
            FUNCTION_MAP[Types.STYLE_SHEET] = stringToStyleSheet;
            FUNCTION_MAP[Types.URL_REQUEST] = stringToUrlRequest;
        }

        /**
         * <p>This method allows you to register other functions to handle types
         * this utility is not set up to convert.</p>
         */
        public static function registerFunction(name:String, funct:Function):void
        {
            FUNCTION_MAP[name] = funct;
        }

        /**
         *
         */
        public static function removeFunction(name:String):void
        {
            delete FUNCTION_MAP[name];
        }

        /**
         * <p>This function handles converting the data into the supplied type.</p>
         *
         *    <p>This function also has a special default function call when
         *    unknown_type_handler is set. To use this supply a function to call
         *    when the helper class doesn't know what to convert the data to.</p>
         *
         *    <p>The unknown_type_handler should accept data and type. This allows
         *    you to customize the class and extend its functionality on the fly
         *    without having to directly extend and override the main switch logic.</p>
         *
         *    @param data String representing the value that needs to be
         *    converted.
         *    @param type String representing the type the data should be
         *    converted into. Accepts string, number, array, boolean, associate
         *    array, dictionary, object, color and hex color.
         *    @return Converted data typed to supplied type value.
         *
         */
        public static function getType(data:String, type:String):*
        {
            return FUNCTION_MAP[type] ? FUNCTION_MAP[type](data) : data;
        }

    }
}

