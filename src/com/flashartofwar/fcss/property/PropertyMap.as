/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: PropertyMap.as</p>
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
 * 	2.0  Initial version April 9, 2009</p>
 *
 */

package com.flashartofwar.fcss.property {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	dynamic public class PropertyMap extends AbstractSelector
	{

		protected var propsByType : Dictionary = new Dictionary( true );
		public var propertyTypes : Array = new Array( );

		/**
		 *
		 *
		 */
		public function PropertyMap()
		{
			super( this );
		}

		/**
		 *
		 *
		 */
		override protected function registerClass() : void
		{
			registerClassAlias( "camo.core.property.PropertyMap", PropertyMap );
		}

		/**
		 *
		 * @param name
		 * @param value
		 *
		 */
		override protected function $setProperty(name : *, type : *) : void
		{
			type = (type is String) ? String(type).toLowerCase() : type;

			super.$setProperty( name, type );

			registerType( name, type );
		}

		/**
		 *
		 * @param name
		 * @param type
		 *
		 */
		protected function registerType(name : String, type : String) : void
		{

			if (! propsByType[type])
                propsByType[type] = new Array( );

			Array(propsByType[type]).push( name );

			if (propertyTypes.indexOf( type ) == - 1)
                propertyTypes.push( type );
		}

		/**
		 *
		 * @param type
		 * @return
		 *
		 */
		public function getPropsByTypes(... types) : Array
		{

			var results : Array = new Array( );

			var key : String;

			for (key in propsByType)
			{

				if ((types.indexOf( key ) != - 1) && (propsByType[key]))
				{
					var props : Array = propsByType[key].slice( );
					results = results.concat( props );
				}
			}

			return results;
		}

		/**
		 *
		 * @param name
		 * @return
		 *
		 */
		override protected function $deleteProperty(name : *) : Boolean
		{
			var type : String = properties[name];
			var wasDeleted : Boolean = super.$deleteProperty( name );

			if (wasDeleted)
			{
				propsByType[type].splice( propsByType[type].indexOf( name.toString( ) ), 1 );
			}

			return wasDeleted;
		}

		/**
		 *
		 * @return
		 *
		 */
		override public function clone() : ISelector
		{
			var myBA : ByteArray = new ByteArray( );
			myBA.writeObject( this );
			myBA.position = 0;
			return (PropertyMap( myBA.readObject( ) ));
		}
	}
}