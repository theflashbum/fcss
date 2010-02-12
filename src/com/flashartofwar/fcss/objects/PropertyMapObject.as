/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: PropertyMapObject.as</p>
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
    import flash.net.registerClassAlias;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;

    /**
     * @author jessefreeman
     */
    public dynamic class PropertyMapObject extends AbstractOrderedObject
    {

        public var propertyTypes:Array = new Array();

        protected var propsByType:Dictionary = new Dictionary(true);

        /**
         * <p>PropertyMapObject extends AbstractOrderedObject and adds the ability
         * to return properties by their Types. Lets say you want all the Number
         * property names or all the String property names. This also retains the
         * order of each property added and handles indexing automatically when
         * added to the instance.</p>
         *
         * <p>This class is primarilly used by the StyleApplierUtil.</p>
         */
        public function PropertyMapObject()
        {
            super(this);
        }

        /**
         *
         * @return
         *
         */
        public function clone():PropertyMapObject
        {
            var myBA:ByteArray = new ByteArray();
            myBA.writeObject(this);
            myBA.position = 0;
            return (PropertyMapObject(myBA.readObject()));
        }

        /**
         * <p>This method allows you to get an array of property names based on
         * any set of types. If you want to get all Number properties or Number
         * and Strings use this.</p>
         *
         * @param type
         * @return
         *
         */
        public function getPropsByTypes(... types):Array
        {

            var results:Array = new Array();

            var key:String;

            for (key in propsByType)
            {

                if ((types.indexOf(key) != -1) && (propsByType[key]))
                {
                    var props:Array = propsByType[key].slice();
                    results = results.concat(props);
                }
            }

            return results;
        }

        /**
         * @private
         */
        override protected function $deleteProperty(name:*):Boolean
        {
            var type:String = properties[name];
            var wasDeleted:Boolean = super.$deleteProperty(name);

            if (wasDeleted)
            {
                propsByType[type].splice(propsByType[type].indexOf(name.toString()), 1);
            }

            return wasDeleted;
        }

        /**
         * @private
         */
        override protected function $setProperty(name:*, type:*):void
        {
            type = (type is String) ? String(type).toLowerCase() : type;

            super.$setProperty(name, type);

            registerType(name, type);
        }

        /**
         * @private
         */
        override protected function registerClass():void
        {
            registerClassAlias("com.flashartofwar.fcss.styles.PropertyMap", PropertyMapObject);
        }

        /**
         * @private
         */
        protected function registerType(name:String, type:String):void
        {
            if (!propsByType[type])
                propsByType[type] = new Array();

            propsByType[type].push(name);

            if (propertyTypes.indexOf(type) == -1)
                propertyTypes.push(type);
        }
    }
}

