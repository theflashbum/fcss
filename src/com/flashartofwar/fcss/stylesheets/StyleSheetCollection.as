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
 *        1.0.0  Initial version Feb 11, 2010</p>
 *
 */

package com.flashartofwar.fcss.stylesheets
{
    import com.flashartofwar.fcss.enum.CSSProperties;
    import com.flashartofwar.fcss.styles.IStyle;
    import com.flashartofwar.fcss.styles.Style;

    /**
     * @author jessefreeman
     */
    public class StyleSheetCollection implements IStyleSheetCollection
    {

        public static const baseStyleSheetName:String = "StyleSheet1";
        public static const defaultSheetName:String = "StyleSheet";
        protected var styleSheetInstances:Array = [];
        protected var _styleSheetNames:Array = [];
        protected var _name:String;

        /**
         *
         * @param enforcer
         *
         */
        public function StyleSheetCollection()
        {
        }

        public function get styleSheetNames():Array
        {
            return _styleSheetNames.slice();
        }

        /**
         *
         * @param id
         * @param sheet
         *
         */
        public function addStyleSheet(sheet:IStyleSheet, name:String = null):IStyleSheet
        {
            // Force the name of the sheet to be the name associated in the collection.
            if (name == null)
                name = sheet.name;

            var index:int = _styleSheetNames.indexOf(name);
            if (index == -1)
            {
                styleSheetInstances.push(sheet);
                _styleSheetNames.push(name);
            }
            else
            {
                styleSheetInstances[index] = sheet;
            }
            return sheet;
        }

        /**
         *
         * @return
         */
        public function get baseStyleSheet():IStyleSheet
        {
            if (!styleSheetInstances[0])
                return addStyleSheet(new FStyleSheet(), baseStyleSheetName);
            else
                return styleSheetInstances[0] as IStyleSheet;
        }

        /**
         *
         */
        public function clear():void
        {
            styleSheetInstances.length = 0;
            _styleSheetNames.length = 0;
        }

        /**
         *
         * @param styleName
         * @return
         *
         */
        public function getStyle(... styleNames):IStyle
        {
            var baseStyle:IStyle = createEmptyStyle();
            var styleName:String;
            var mergedStyle:IStyle;
            var tempStyle:IStyle;
            var nextStyleName:String;

            var i:int;
            var totalStyles:int = styleNames.length;

            var j:int;
            var totalSheets:int = totalStyleSheets;

            var k:int;
            var totalInChain:int;

            for (i = 0; i < totalStyles; i ++)
            {
                styleName = styleNames[i];

                if (hasStyle(styleName))
                {
                    var chain:Array = styleInheritanceChain(styleName);

                    totalInChain = chain.length;
                    mergedStyle = createEmptyStyle();

                    for (j = 0; j < totalInChain; j ++)
                    {
                        nextStyleName = chain[j];
                        for (k = 0; k < totalSheets; k ++)
                        {
                            tempStyle = IStyleSheet(styleSheetInstances[k]).styleLookup(nextStyleName, false);
                            mergedStyle.merge(tempStyle);
                        }
                    }

                    baseStyle.merge(mergedStyle);

                    baseStyle.styleName = styleName;
                }

            }
            return baseStyle;
        }

        protected function createEmptyStyle():IStyle
        {
            return new Style() as IStyle;
        }

        /**
         *
         * @param id
         */
        public function getStyleSheet(name:String):IStyleSheet
        {
            var index:int = _styleSheetNames.indexOf(name)
            return styleSheetInstances[index];
        }

        /**
         *
         * @param name
         * @return
         */
        public function hasStyle(name:String):Boolean
        {
            var index:Number = styleNames.indexOf(name);
            return (index == -1) ? false : true;
        }

        /**
         *
         * @param styleName
         * @param propertystyle
         */
        public function newStyle(name:String, style:IStyle):void
        {
            baseStyleSheet.newStyle(name, style);
        }

        /**
         *
         * @param CSSText
         * @param compressText
         */
        public function parseCSS(CSSText:String, compressText:Boolean = true):IStyleSheet
        {
            var styleSheet:FStyleSheet = new FStyleSheet();
            styleSheet.parseCSS(CSSText, compressText);
            var nextID:Number = totalStyleSheets + 1
            styleSheet.name = defaultSheetName + nextID;
            addStyleSheet(styleSheet, styleSheet.name);
            return styleSheet;
        }

        /**
         *
         * @param name
         * @return
         */
        public function relatedStyles(name:String):Array
        {
            var related:Array = [];
            var tempRelated:Array;
            var styleSheetName:String;

            var total:int = totalStyleSheets;
            var i:int;
            for (i = 0; i < total; i++)
            {
                tempRelated = IStyleSheet(styleSheetInstances[i]).relatedStyles(name);
                related.push.apply(null, tempRelated);
            }

            return related;


        }

        /**
         *
         * @param id
         *
         */
        public function removeStyleSheet(name:String):IStyleSheet
        {
            var index:Number = _styleSheetNames.indexOf(name);

            var styleSheet:IStyleSheet = styleSheetInstances[index];

            // Remove reference to sheets
            styleSheetInstances.splice(index, 1);
            _styleSheetNames.splice(index, 1);

            return styleSheet;
        }

        /**
         *
         * @return
         */
        public function get styleNames():Array
        {
            var styleNames:Array = [];

            var styleSheet:IStyleSheet;
            var styles:Array;
            var total:int;
            var i:int;
            var styleName:String;

            //TODO this may need to be optimized a lot more
            for each (styleSheet in styleSheetInstances)
            {
                styles = styleSheet.styleNames;
                total = styles.length;

                for (i = 0; i < total; i ++)
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
        public function toString():String
        {
            return styleSheetInstances.join();
        }

        /**
         *
         * @return
         */
        public function get totalStyleSheets():Number
        {
            return styleSheetInstances.length;
        }

        public function get name():String
        {
            return _name;
        }

        public function set name(value:String):void
        {
            _name = value;
        }

        public function styleLookup(styleName:String, getRelated:Boolean = true):IStyle
        {
            var baseStyle:IStyle = createEmptyStyle();
            var tempStyle:IStyle;
            var styleSheet:IStyleSheet;

            for each (styleSheet in styleSheetInstances)
            {
                tempStyle = styleSheet.styleLookup(styleName, getRelated);
                if (tempStyle.styleName != CSSProperties.DEFAULT_STYLE_NAME)
                    baseStyle.merge(tempStyle);
            }

            return baseStyle;
        }

        protected function styleInheritanceChain(styleName:String):Array
        {

            var chain:Array = [];

            var styleSheet:IStyleSheet;
            var tempRelated:Array;

            for each (styleSheet in styleSheetInstances)
            {
                tempRelated = styleSheet.relatedStyles(styleName);
                chain.push.apply(null, tempRelated);
            }

            chain.push(styleName);

            return chain;
        }
    }
}

