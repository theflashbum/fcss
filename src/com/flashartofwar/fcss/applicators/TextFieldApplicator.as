/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: TextFieldApplicator.as</p>
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

package com.flashartofwar.fcss.applicators
{
    import com.flashartofwar.fcss.enum.TextFieldProperties;
    import com.flashartofwar.fcss.enum.TextFormatProperties;
    import com.flashartofwar.fcss.utils.CSSTidyUtil;

    import flash.text.StyleSheet;
    import flash.text.TextField;
    import flash.text.TextFormat;

    public class TextFieldApplicator extends AbstractApplicator
    {

        private static const STYLE_SHEET:String = "styleSheet";


        public function TextFieldApplicator()
        {
            super(this);
        }

        /**
         * This utility helps apply Styles to TextFields. Pass in a TextField
         * and a Style and the utility will handle everything for you. The method
         * will parse out props for TextField, TextFormat, and native StyleSheet.
         */
        override public function applyStyle(target:Object, styleObject:Object):void
        {

            if (target is TextField)
            {

                var textFormat:TextFormat = new TextFormat();
                var filteredProp:String;
                var prop:String;
                var value:String;

                for (prop in styleObject)
                {

                    filteredProp = propertyFilter(prop);
                    value = styleObject[prop];
                    //trace("Value", value);
                    if (TextFieldProperties.isSupported(filteredProp))
                    {
                        target[filteredProp] = TextFieldProperties.cleanupProp(filteredProp, value);
                    }
                    else if (TextFormatProperties.isSupported(filteredProp))
                    {
                        textFormat[TextFormatProperties.convertProp(filteredProp)] = TextFormatProperties.cleanupProp(filteredProp, value);
                    }
                    else if (filteredProp == STYLE_SHEET)
                    {
                        if (value)
                        {
                            var tempStyleSheet:StyleSheet = new StyleSheet();
                            tempStyleSheet.parseCSS(TextFieldProperties.cleanupProp(filteredProp, value));
                        }
                        else
                        {
                            // There was no CSS to parse
                        }
                    }
                    else
                    {
                        propertyNotFound(prop);
                    }
                }

                target.defaultTextFormat = textFormat;

                if (tempStyleSheet)
                {
                    target.styleSheet = tempStyleSheet;
                }

            }
            else
            {
                throw new Error("The supplied target was not a TextField.");
            }

        }

        override protected function propertyFilter(value:String):String
        {
            return CSSTidyUtil.camelize(value, "-");
        }

    }
}

