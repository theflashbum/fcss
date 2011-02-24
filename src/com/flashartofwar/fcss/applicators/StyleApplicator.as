/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: StyleApplicator.as</p>
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
    import com.flashartofwar.fcss.objects.PropertyMapObject;
    import com.flashartofwar.fcss.utils.*;

    /**
     * @author jessefreeman
     */
    public class StyleApplicator extends AbstractApplicator
    {

        public function StyleApplicator()
        {
            super(this);
        }

        /**
         * <p>This method will loop through the properties of a Style and attempt
         * to apply them to the target object. There is a lot going on under the
         * hood to make this process as fast as possible.</p>
         *
         * @param target
         * @param style
         */
        override public function applyStyle(target:Object, style:Object):void
        {
            var propMap:PropertyMapObject = PropertyMapUtil.propertyMap(target);
            var filteredProp:String;
            var prop:String;

            for (prop in style)
            {
                filteredProp = propertyFilter(prop);

                if (target.hasOwnProperty(filteredProp))
                {

                    var type:String = propMap[filteredProp];

                    target[filteredProp] = valueFilter(style[prop], type);
                }
                else
                {
                    propertyNotFound(prop);
                }
            }
        }

        override protected function valueFilter(value:String, type:String):*
        {
            return TypeHelperUtil.getType(value, type);
        }

    }
}

