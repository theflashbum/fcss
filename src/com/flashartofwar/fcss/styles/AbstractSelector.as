/** 
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: AbstractSelector.as</p>
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

package com.flashartofwar.fcss.styles {
	
	import flash.errors.IllegalOperationError;
	import flash.net.registerClassAlias;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	dynamic public class AbstractSelector extends Proxy implements ISelector
	{
		protected var properties : Object = new Object( );
		protected var propertiesIndex : Array = new Array( );

		/**
		 * 
		 * <p>Properties is a special object that contains the names and values
		 * of properties another class can use to configure itself off of. Unlike
		 * a regular Object, the Properties instance keeps an ordered list to 
		 * allow ordered looping through it's values. This assures that the order
		 * of the values set will be correctly returned in the order expected.</p>
		 *  
		 * @param properties
		 * @param propertiesIndex
		 * 
		 */		
		public function AbstractSelector(self : AbstractSelector)
		{
			if(self != this)
			{
				//only a subclass can pass a valid reference to self
				throw new IllegalOperationError( "Abstract class did not receive reference to self. MyAbstractType cannot be instantiated directly." );
			}
			else
			{
				registerClass( );
			}
		}

		/**
		 * @private
		 *  
		 * <p>It is important to override this class so that the correct Class
		 * Alias is registered when doing a clone.</p>
		 */		
		protected function registerClass() : void
		{
			registerClassAlias( "camo.core.property.AbstractProperties", AbstractSelector );
		}

		/**
		 * 
		 * @private
		 * 
		 * @param name
		 * @return 
		 * 
		 */	
		override flash_proxy function deleteProperty(name : *) : Boolean
		{
			return $deleteProperty( name );
		}

		/**
		 * 
		 * @param name
		 * @return 
		 * 
		 */		
		protected function $deleteProperty(name : *) : Boolean
		{
			var wasDeleted : Boolean = delete properties[name];
			if (wasDeleted)
			{
				propertiesIndex.splice( propertiesIndex.indexOf( name ), 1 );
			}
			return wasDeleted;	
		}

		/**
		 * 
		 * @private
		 * 
		 * @param name
		 * @return 
		 * 
		 */	
		override flash_proxy function getProperty(name : *) : *
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
		override flash_proxy function hasProperty(name : *) : Boolean
		{
			return properties.hasOwnProperty( name );
		}

		/**
		 * 
		 * @private
		 * 
		 * @param index
		 * @return 
		 * 
		 */	
		override flash_proxy function nextName(index : int) : String
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
		override flash_proxy function nextNameIndex(index : int) : int
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
		override flash_proxy function nextValue(index : int) : *
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
		override flash_proxy function setProperty(name : *, value : *) : void
		{
			$setProperty( name, value );
		}

		/**
		 * 
		 * @return 
		 * 
		 */		
		protected function $setProperty(name : *, value : *) : void
		{
			properties[name] = value;
	
			if (propertiesIndex.indexOf( name ) == - 1)
				propertiesIndex.push( name.toString( ) );
		}

		/**
		 * 
		 * @private
		 * 
		 * @return 
		 * 
		 */	
		public function toString() : String
		{
			var styleString : String = "{";
			
			for (var prop:String in properties)
			{
				styleString = styleString.concat( prop, ":", properties[prop].toString( ), ";" );
			}
			
			styleString = styleString.concat( "}" );
			
			return styleString;
		}

		/**
		 * 
		 * <p>Merges the properties of one group of properties with the current
		 * instances values. The supplied properties have a higher importance and
		 * will override any properties with the same name.</p>
		 * 
		 * <p>It is important to note that the selectorName will also be overrode
		 * by the new properties.</p>
		 *  
		 * @param style
		 * 
		 */		
		public function merge(properties : ISelector) : void
		{
			for(var prop:String in properties) 
			{
				this[prop] = properties[prop];
			}
		}

		/**
		 * 
		 * <p>Performs a deep copy of all the values from the Properties 
		 * instance.</p>
		 * 
		 * @return 
		 * 
		 */		
		public function clone() : ISelector
		{
			return null;
		}
	}
}