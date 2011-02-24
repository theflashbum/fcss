/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: AbstractOrderedObject.as</p>
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

package com.flashartofwar.fcss.objects
{
    import flash.errors.IllegalOperationError;
    import flash.net.registerClassAlias;
    import flash.utils.Proxy;
    import flash.utils.flash_proxy;

    /**
     * @author jessefreeman
     */
    public dynamic class AbstractOrderedObject extends Proxy
    {

        protected var properties:Object = new Object();

        protected var propertiesIndex:Array = new Array();

        /**
         *
         * <p>AbstractOrderedObject is a special object that keeps an ordered
         * list of each property added to it to allow ordered looping through
         * it's values. This assures that the order of the values set will be
         * correctly returned in the order expected.</p>
         *
         * @param properties
         * @param propertiesIndex
         *
         */
        public function AbstractOrderedObject(self:AbstractOrderedObject)
        {
            if (self != this)
            {
                //only a subclass can pass a valid reference to self
                throw new IllegalOperationError("Abstract class did not receive reference to self. AbstractOrderedObject cannot be instantiated directly.");
            }
            else
            {
                registerClass();
            }
        }

        /**
         *
         * <p>Merges the properties of one group of properties with the current
         * instances values. The supplied properties have a higher importance and
         * will override any properties with the same name.</p>
         *
         * <p>It is important to note that this is a 1 to 1 copy so Arrays, Object
         * and other "complex" property values will not be cleanly copied over.
         * This is meant to be used when you know a merge is ok to have references
         * to the actualy object getting merged in.</p>
         *
         * @param style
         *
         */
        public function merge(object:Object):void
        {
            for (var prop:String in object)
            {
                this[prop] = object[prop];
            }
        }

        /**
         * @private
         */
        public function toString():String
        {
            var styleString:String = "{";
            var i:int;
            var total:int = propertiesIndex.length;
            var prop:String;
            for (i = 0; i < total; i++)
            {
                prop = propertiesIndex[i];
                styleString = styleString.concat(prop, ":", properties[prop].toString(), ";");
            }

            styleString = styleString.concat("}");

            return styleString;
        }

        /**
         * @private
         */
        protected function $deleteProperty(name:*):Boolean
        {
            var wasDeleted:Boolean = delete properties[name];
            if (wasDeleted)
            {
                propertiesIndex.splice(propertiesIndex.indexOf(name), 1);
            }
            return wasDeleted;
        }

        /**
         * @private
         *
         * @return
         *
         */
        protected function $setProperty(name:*, value:*):void
        {
            if (!properties.hasOwnProperty(name))
            {
                propertiesIndex.push(name.toString());
            }

            properties[name] = value;

        }

        /**
         * @private
         *
         * <p>It is important to override this class so that the correct Class
         * Alias is registered when doing a clone.</p>
         */
        protected function registerClass():void
        {
            registerClassAlias("com.flashartofwar.fcss.styles.AbstractProperties", AbstractOrderedObject);
        }

        /**
         *
         * @private
         *
         * @param name
         * @return
         *
         */
        flash_proxy override function deleteProperty(name:*):Boolean
        {
            return $deleteProperty(name);
        }

        /**
         *
         * @private
         *
         * @param name
         * @return
         *
         */
        flash_proxy override function getProperty(name:*):*
        {
            return properties[name];
        }

        /**
         *
         * @private
         *
         * @param name
         * @return
         *
         */
        flash_proxy override function hasProperty(name:*):Boolean
        {
            return properties.hasOwnProperty(name);
        }

        /**
         *
         * @private
         *
         * @param index
         * @return
         *
         */
        flash_proxy override function nextName(index:int):String
        {
            return propertiesIndex[index - 1];
        }

        /**
         *
         * @private
         *
         * @param index
         * @return
         *
         */
        flash_proxy override function nextNameIndex(index:int):int
        {
            if (index < propertiesIndex.length)
                return index + 1;
            else
                return 0;
        }

        /**
         *
         * @private
         *
         * @param index
         * @return
         *
         */
        flash_proxy override function nextValue(index:int):*
        {
            return properties[propertiesIndex[index - 1]];
        }

        /**
         *
         * @private
         *
         * @param name
         * @param value
         *
         */
        flash_proxy override function setProperty(name:*, value:*):void
        {
            $setProperty(name, value);
        }
    }
}

