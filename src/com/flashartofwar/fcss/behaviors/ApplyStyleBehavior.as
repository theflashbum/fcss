/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: ApplyStyleBehavior.as</p>
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

package com.flashartofwar.fcss.behaviors
{
    import com.flashartofwar.fcss.applicators.IApplicator;
    import com.flashartofwar.fcss.enum.CSSProperties;
    import com.flashartofwar.fcss.styles.IStyle;
    import com.flashartofwar.fcss.stylesheets.IStyleSheet;

    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import flash.utils.getQualifiedClassName;

    /**
     * @author jessefreeman
     */
    public class ApplyStyleBehavior extends EventDispatcher implements IApplyStyleBehavior
    {
        public static const DEFAULT:String = "default";

        public static const UP:String = "up";

        protected static const ID_DELIMITER:String = " ";

        protected var _className:String;

        protected var _id:String;

        protected var target:Object;

        protected var _defaultStyleNames:Array;

        protected var _styleSheet:IStyleSheet;

        protected var stateSelectorCache:Array = new Array();

        protected var cachedProperties:Dictionary = new Dictionary(true);

        protected var _applicator:IApplicator;

        /**
         * <p>The ApplyStyleBehavior encapsulates the logic needed to find an
         * Object's style from a supplied styleID and it's Class Name. This class
         * allows you to quickly add auto-magic style lookup from the global
         * StyleSheetManager class through composition. Simply add an instance of
         * this class to any class's constructor and supply a unique styleID and
         * a reference of the class into the ApplyStyleBehavior instance.</p>
         *
         * <p></p>
         * @param styleID- string that represents the StyleID this class will use.
         * The styleID can be overloaded with multiple style names by using spaces.
         * It is important to note that what ever the last styleID is will
         * automatically get a # sign added to it. All other styles will be used
         * as is.
         *
         * @param target Instance that will be used to apply styles onto and
         * also to find it's class name.
         */

        public function ApplyStyleBehavior(target:Object, applicator:IApplicator, styleSheet:IStyleSheet, styleID:String, styleClass:String = null)
        {
            this.target = target;
            _applicator = applicator;
            _styleSheet = styleSheet;
            parseStyleNames(styleID, styleClass);
            applyDefaultStyle();
        }

        /**
         *    <p>This will reapply the default styles the class started with.</p>
         */

        public function get defaultStyleNames():Array
        {
            return _defaultStyleNames.slice();
        }

        public function set defaultStyleNames(value:Array):void
        {
            _defaultStyleNames = value;
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

        public function applyDefaultStyle(pseudoSelector:String = null):void
        {

            var style:IStyle;

            if (pseudoSelector != null)
            {
                style = getPseudoSelector(pseudoSelector);
            }
            else
            {
                style = _styleSheet.getStyle.apply(null, defaultStyleNames);
            }

            if (style.styleName != CSSProperties.DEFAULT_STYLE_NAME)
                applyStyle(style);
        }

        /**
         * <p>This applies a supplied style to the class. It uses the
         * StyleApplierUtil to automatically convert the style's property
         * values to the correct type and apply them.</p>
         *
         * <p>Any public property can be configured by a style. If property
         * requires custom type conversion you will need to register that with
         * the StyleApplierUtil before calling this method. See the StyleApplierUtil
         * documentation for help on how to do that.</p>
         * @param style
         */
        public function applyStyle(style:IStyle):void
        {
            _applicator.applyStyle(target, style);
        }

        /**
         * <p>Returns the Class name of the ApplyStyleBehvior's target instance.
         * This class name does not include the "." sign which is automatically
         * added when a style is requested.</p>
         *
         * @return
         */
        public function get className():String
        {

            if (!_className)
            {
                _className = getQualifiedClassName(target).split("::").pop();
            }
            return _className;
        }

        /**
         * <p>This returns the ID used to find it's id style name. This id
         * does not include the "#" sign which is automatically added when a
         * style is requested.</p>
         *
         * @return
         */
        public function get id():String
        {
            return _id;
        }

        /**
         *
         * @param id
         */
        protected function parseStyleNames(styleID:String, styleClass:String = null):void
        {

            if (styleClass != null)
            {
                _defaultStyleNames = styleClass.replace(/ /g, " .").split(" ");
                _defaultStyleNames[0] = "." + _defaultStyleNames[0];
            }
            else
            {
                _defaultStyleNames = [];
            }

            // clean up styles
            _defaultStyleNames.unshift(className);

            _id = styleID;
            _defaultStyleNames.push("#" + _id);
        }

        public function getPseudoSelector(state:String):IStyle
        {

            if (! stateSelectorCache[state])
            {
                var pseudoSelector:String = "";

                // Just restore default style if no state is provided
                if ((state != UP) && (state != DEFAULT))
                {
                    pseudoSelector = ":" + state;
                }

                var selectorNames:Array = defaultStyleNames;

                var total:Number = selectorNames.length;

                for (var i:int = 0; i < total; i ++)
                {
                    selectorNames[i] = selectorNames[i] += pseudoSelector;
                }

                // Cache Selector names
                stateSelectorCache[state] = selectorNames;
            }

            // create unique id for selector name
            var selectorNamesID:String = stateSelectorCache[state].toString();
            var tempStyle:IStyle;

            if (cachedProperties[selectorNamesID])
            {
                tempStyle = cachedProperties[selectorNamesID].clone();
            }
            else
            {
                tempStyle = _styleSheet.getStyle.apply(null, stateSelectorCache[state]);
                cachedProperties[selectorNamesID] = tempStyle;
            }

            return tempStyle;
        }

    }
}

