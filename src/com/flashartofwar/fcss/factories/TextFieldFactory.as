/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: TextFieldFactory.as</p>
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

package com.flashartofwar.fcss.factories
{
    import com.flashartofwar.fcss.applicators.IApplicator;
    import com.flashartofwar.fcss.styles.IStyle;
    import com.flashartofwar.fcss.stylesheets.IStyleSheet;

    import flash.text.TextField;

    /**
     * @author Jesse Freeman
     */
    public class TextFieldFactory
    {
        protected var _styleSheet:IStyleSheet;
        protected var _applicator:IApplicator;

        public function TextFieldFactory(applicator:IApplicator, styleSheet:IStyleSheet)
        {
            _styleSheet = styleSheet;
            _applicator = applicator;
        }

        public function get styleSheet():IStyleSheet
        {
            return _styleSheet;
        }

        public function set styleSheet(value:IStyleSheet):void
        {
            _styleSheet = value;
        }

        public function get applicator():IApplicator
        {
            return _applicator;
        }

        public function set applicator(value:IApplicator):void
        {
            _applicator = value;
        }

        /**
         *
         * @param id
         * @param className
         * @return
         */
        public function createTextField(id:String = "textField", className:String = "TextField"):TextField
        {
            var textField:TextField = new TextField();

            var style:IStyle = _styleSheet.getStyle("." + className, "#" + id);

            _applicator.applyStyle(textField, style);

            return textField;
        }

    }
}


