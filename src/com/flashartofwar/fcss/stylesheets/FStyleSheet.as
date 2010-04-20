/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: FStyleSheet.as</p>
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
    import com.flashartofwar.fcss.styles.IStyle;
    import com.flashartofwar.fcss.styles.Style;
    import com.flashartofwar.fcss.utils.CSSTidyUtil;

    /**
     * @author jessefreeman
     */
    public class FStyleSheet implements IStyleSheet
    {

        protected static const CSS_BLOCKS:RegExp = /[^{]*\{([^}]*)*}/g;
        protected static const CSS_VAR_PATTERN:RegExp = /var\(([\w'-]+)\)/g;
        protected static const FIND_A_HREF_CLASS:RegExp = /a\.([^\:]+)/gi;
        protected static const STYLE_SHEET:String = "style-sheet";
        protected static const STYLE_SHEET_CAMEL:String = "styleSheet";
        protected var cssText:String;
        protected var styleIndex:Array = []; // holds a lookup table for all parsed CSS classes
        protected var relatedstyleIndex:Array = []; // holds arrays for related classes base on Class's Name ID
        protected var cachedstyles:Array = [];
        protected var _styleNames:Array = [];
        protected var _name:String;

        /**
         *
         * @return
         *
         */
        public function get styleNames():Array
        {
            return _styleNames.slice();
        }

        /**
         * <p>Class constructor.</p>
         */
        public function FStyleSheet(name:String = "undefined")
        {
            this.name = name;
            super();
        }

        /**
         * <p>Check to see if style exists.</p>
         *
         * @param styleName
         * @return
         *
         */
        public function hasStyle(name:String):Boolean
        {
            return (_styleNames.indexOf(name) == - 1) ? false : true;
        }

        /**
         * <p>Returns a list of related styles.</p>
         * @param styleName
         * @return
         *
         */
        public function relatedStyles(name:String):Array
        {
            return (relatedstyleIndex[name]) ? relatedstyleIndex[name].slice() : [];
        }

        /**
         *
         * @return
         *
         */
        public function toString():String
        {
            return cssText;
        }

        /**
         *
         *
         */
        public function clear():void
        {
            cssText = "";
            cachedstyles.length = 0;
            _styleNames.length = 0;
        }

        /**
         *
         * @param cssText
         *
         */
        public function parseCSS(cssText:String, useCSSTidy:Boolean = true):IStyleSheet
        {
            cachedstyles.length = 0;
            this.cssText = useCSSTidy ? tidy(cssText) : cssText;
            indexCSS(this.cssText);

            // Force @variables to cache
            var style:IStyle = getStyle("@variables");

            return this;
        }

        /**
         * <p>This looks up a style and returns an object. To help support style
         * inheritance you can also pass in an comma delimited string and have
         * the list merged into one style based on the order of the list. The
         * first item being lower all the way up to the last in the list.</p>
         *
         * @param styleName
         * @return
         *
         */
        public function getStyle(... styleNames):IStyle
        {
            // Split styles and get the total related classes
            var total:Number = styleNames.length;
            var baseProperties:IStyle = createEmptyStyle();
            // Loop through styles and merges them into a single style.
            for (var i:Number = 0; i < total; i ++)
            {
                if (hasStyle(styleNames[i]))
                {
                    var currentPropertiesID:String = styleNames[i];
                    var tempProperties:IStyle = styleLookup(currentPropertiesID);

                    baseProperties.merge(tempProperties);
                }
            }

            // Returns megred style
            return baseProperties;
        }

        /**
         *
         * @param styleName
         * @param propertystyle
         *
         */
        public function newStyle(name:String, style:IStyle):void
        {
            if (_styleNames.indexOf(name) == - 1)
                _styleNames.push(name);

            if (style.styleName != name)
                style.styleName = name;

            cachedstyles[name] = style;
        }

        /**
         * <p>Creates a style sheet string from supplied style names. You can combine
         * Properties into a larger style sheet by separating styles by a comma.
         * If no styleName is provided the entire set of styles will be included
         * in the new styleSheet.</p>
         *
         * <p>Its important to note that this is incredibly expensive to perform
         * on large CamoStyeSheets. To avoid this, make sure you pass in only
         * the styles you need.</p>
         *
         * @param styleName comma separated list of styles that will be used
         * to create a style sheet string.
         * @return String style sheet from passed in styles
         *
         */
        public function clone(... styleNames):FStyleSheet
        {
            var tempStyleSheet:FStyleSheet = new FStyleSheet();
            var total:Number = styleNames.length;

            if (total == 0)
            {
                tempStyleSheet.parseCSS(cssText.toString());
            }
            else
            {
                var tempCSSText:String = "";

                //TODO right now this just combines styles into one string, need to add support for style inheritance.

                // Loop through styles and merges them into a single style.
                for (var i:Number = 0; i < total; i ++)
                {
                    if ((hasStyle(styleNames[i]) && (styleNames[i] is String)))
                    {
                        tempCSSText += getStyle(styleNames[i]).toString();
                    }
                }
                // Strip classes from a styles
                tempCSSText = tempCSSText.replace(FIND_A_HREF_CLASS, "a");

                tempStyleSheet.parseCSS(tempCSSText, false);
            }

            return tempStyleSheet;
        }

        /**
         *
         * @return
         *
         */
        protected function createEmptyStyle():IStyle
        {
            return new Style() as IStyle;
        }

        /**
         *
         * @param cssTest
         * @return
         *
         */
        protected function tidy(cssTest:String):String
        {
            return CSSTidyUtil.tidy(cssTest);
        }

        /**
         * <p>Does a preliminary run through of the css styles and indexes them.
         * This is only done once and to helps speed up the retrieval of the raw
         * css style cssText. Its important to note that this index is only for
         * the style and its string content. Any CSS props inside of the
         * style are not parsed here. This is simply used as a lookup table
         * for the raw cssText.</p>
         *
         * @param css
         *
         */
        protected function indexCSS(css:String):void
        {
            // Use RegEx to get all css blocks - anything inside of { }  along with the style (name)
            var blocks:Array = css.match(CSS_BLOCKS);
            // get reference of the total blocks found to speed up for i loop
            var total:Number = blocks.length;

            // Loop through all styles, get the style name and its cssText, then store it in the index
            for (var i:int = 0; i < total; i ++)
            {
                parseStyleBlock(blocks[i]);
            }
        }

        /**
         * <p>This splits up a CSS style from its cssText. By doing the split on
         * the "{" we can assume anything in index 0 of the array is the style's
         * name, and the rest is the css props. Also we cut off the last character
         * (in this case the trailing "}") to make sure we get a clean reference
         * to the css properties inside.</p>
         *
         * @param cssClass
         * @return
         *
         */
        protected function parseStyleBlock(cssClass:String):void
        {
            var splitBlock:Array = cssClass.split("{");

            var related:Array = String(splitBlock[0]).split(" ");
            var styleName:String = related.pop();

            var indexOfColon:Number = styleName.indexOf(":");

            if (indexOfColon != - 1)
            {
                var pseudoBasePropertiesID:String = styleName.substring(0, indexOfColon);
                related.push(pseudoBasePropertiesID);
            }

            var styleBlock:String = String(splitBlock[1]).substr(0, String(splitBlock[1]).length - 1);

            if (_styleNames.indexOf(styleName) != - 1)
            {
                styleIndex[styleName] = String(styleIndex[styleName]).concat(styleBlock);
                clearCachedClass(styleName);
            }
            else
            {
                _styleNames.push(styleName);
                styleIndex[styleName] = styleBlock;
            }

            // Save out array of left over classes
            if (! relatedstyleIndex[styleName])
            {
                relatedstyleIndex[styleName] = related;
            }
        }

        /**
         *
         * @param styleName
         */
        protected function clearCachedClass(styleName:String):void
        {
            if (cachedstyles[styleName])
            {
                delete cachedstyles[styleName];
            }
        }

        /**
         * <p>This goes through a style's name and looks for any related
         * classes separated by a space. With this we can keep an index of related
         * classes based on the class's id as a key. This lets us quickly
         * reference any related class names on the fly without having to re-loop
         * through the css cssText.</p>
         *
         * @param classes
         * @param index
         * @return
         *
         */
        protected function relatedClasses(classes:String):String
        {
            // Split out names of classes
            var related:Array = classes.split(" ");
            var classID:String = related.pop();

            var indexOfColon:Number = classID.indexOf(":");

            if (indexOfColon != - 1)
            {
                var pseudoBasePropertiesID:String = classID.substring(0, indexOfColon);
                related.push(pseudoBasePropertiesID);
            }

            // Save out array of left over classes
            relatedstyleIndex[classID] = related;
            // Return what was found
            return classID;
        }

        /**
         * <p>Core lookup function and is responsible for parsing out css
         * styles, finding related classes, and putting them all together
         * into a clean Properties.</p>
         *
         * <p>The first step is to look for a cached version of the class already
         * requested. If that does not exist it looks up the class id from the
         * cssIndex. Once the cssText is found it can start looping through related
         * classes to build a base css object for the desired class to inherit
         * then override. Once this is done, it is cached in the cachedProperties
         * dictionary and the created object is returned.</p>
         *
         * @param styleName
         * @return
         *
         */
        public function styleLookup(styleName:String, getRelated:Boolean = true):IStyle
        {

            var tempProperties:IStyle = (cachedstyles[styleName]) ? cachedstyles[styleName] : null;

            if (! tempProperties)
            {
                tempProperties = createEmptyStyle();
                if (hasStyle(styleName))
                {
                    // Begin CSS lookup
                    var styleData:String = styleIndex[styleName];
                    var subjectProperties:IStyle = convertStringListToProperties(styleData);

                    if (getRelated)
                    {
                        var ancestors:Array = relatedstyleIndex[styleName];
                        var totalAncestors:Number = ancestors.length;
                        var ancestorProperties:IStyle;

                        for (var i:int = 0; i < totalAncestors; i ++)
                        {
                            ancestorProperties = styleLookup(ancestors[i]);
                            tempProperties.merge(ancestorProperties);
                        }
                    }

                    tempProperties.merge(subjectProperties);
                    tempProperties.styleName = styleName;

                    newStyle(styleName, tempProperties);
                }
            }

            return tempProperties.clone() as IStyle;
        }

        /**
         * <p>This function converts a String list to an object. Used to help
         * split up complex, string lists form css cssText.</p>
         *
         * @param cssText
         * @param propDelim
         * @param listDelim
         */
        protected function convertStringListToProperties(cssText:String, propDelim:String = ":", listDelim:String = ";"):IStyle
        {
            // Start - Test for Variables
            if (cachedstyles["@variables"])
            {
                // If we have a cached variable style run it through the replacer
                cssText = replaceVaribales(cssText, cachedstyles["@variables"]);
            }
            // End - Test for Variables
            var tempObject:IStyle = createEmptyStyle();
            var list:Array = cssText.split(listDelim);
            var total:int = list.length;
            var i:int;

            // Loop through properties
            for (i = 0; i < total; i ++)
            {
                var delimLocation:Number = list[i].indexOf(propDelim);
                var prop:String = cleanUpProp(list[i].slice(0, delimLocation));

                if (prop != "")
                {
                    var value:String = cleanUpValue(prop, list[i].slice(delimLocation + 1));
                    tempObject[prop] = value;
                }
            }

            return tempObject;
        }

        /**
         *
         * @param prop
         * @return
         *
         */
        protected function cleanUpProp(prop:String):String
        {
            return prop;
        }

        /**
         *
         * @param prop
         * @param value
         * @return
         *
         */
        protected function cleanUpValue(prop:String, value:String):String
        {
            switch (prop)
            {
                case STYLE_SHEET:
                case STYLE_SHEET_CAMEL:
                    var styleNames:Array = value.split(",");

                    return buildStyleSheetString.apply(null, styleNames);
                    break;
                default:
                    return value;
                    break;
            }
        }

        /**
         *
         * @param styleNames
         * @return
         *
         */
        protected function buildStyleSheetString(... styleNames):String
        {
            var cssTest:String = clone.apply(null, styleNames).toString();
            return cssTest;
        }

        /**
         * This util will take a string, search for var(tokens) and replace them
         * with the values in the supplied object.
         *
         * @param text - text you would like to search for tokens
         * @param paramObj - an object to use to find and replace tokens with
         * @return
         *
         */
        protected function replaceVaribales(text:String, paramObj:Object):String
        {
            return text.replace(CSS_VAR_PATTERN, function():*
            {
                return paramObj[arguments[1]];
            });
        }

        public function get name():String
        {
            return _name;
        }

        public function set name(value:String):void
        {
            _name = value;
        }
    }
}

