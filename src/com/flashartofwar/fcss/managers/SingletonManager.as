
/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Based on a SingletonManger class by Justin Akin</p>
 * <p>Class File: SingletonManager.as</p>
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
 *		1.0  Initial version Jan 28, 2010</p>
 *
 */

package com.flashartofwar.fcss.managers
{
import flash.utils.Dictionary;

public class SingletonManager
    {
		private static var _instance:SingletonManager;
        
        private var singletons:Dictionary = new Dictionary();

        /**
         * @param enforcer
         */
        public function SingletonManager( enforcer:SingletonEnforcer ) 
        {
			if ( enforcer == null ) throw new Error( "Error: Instantiation failed: Use SingletonManager.instance instead." );
        }
        
        public static function getClassReference( classReference:Class ):*
        {       	
        	return instance.getClassReference( classReference );
        }
        
        public function getClassReference( classReference:Class ):*
        {
        	var singleton:* = singletons[ classReference ];
        	
        	if( !singleton )
        	{
				singleton = new classReference();
        		singletons[ classReference ] = singleton;
        	}
        	
        	return singleton;
        }

        /**
         * @return 
         */             
        private static function get instance():SingletonManager 
        {
        	if( !_instance ) 
			{
				_instance = new SingletonManager( new SingletonEnforcer() );
			}
			
			return _instance;
        }
    }
}

internal class SingletonEnforcer 
{
}