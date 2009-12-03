
/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: StyleSheetManager.as</p>
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
 *		1.0  Initial version Dec 03, 2009</p>
 *
 */

package com.flashartofwar.fcss.managers {
	import com.flashartofwar.fcss.stylesheets.IStyleSheetCollection;
	import com.flashartofwar.fcss.stylesheets.StyleSheetCollection;

	/**
	 * @author jessefreeman
	 */
	public class StyleSheetManager
	{

		public static const INIT:String = "init";

		private static var __styleSheetCollection : IStyleSheetCollection;

		/**
		 *
		 * @return
		 */
		public static function get collection():IStyleSheetCollection
		{
			if (StyleSheetManager.__styleSheetCollection == null)
			{
				StyleSheetManager.__styleSheetCollection = createStyleSheetCollection();
			}
			return StyleSheetManager.__styleSheetCollection;
		}

		/**
		 *
		 * @param collection
		 */
		public static function set collection(styleSheetCollection:IStyleSheetCollection):void
		{
			__styleSheetCollection = styleSheetCollection;	
		}

		private static function createStyleSheetCollection():IStyleSheetCollection
		{
			return new StyleSheetCollection();	
		}

		/**
		 *
		 * @param enforcer
		 * @throws Error
		 */
		public function StyleSheetManager(enforcer:SingletonEnforcer)
		{
			if (enforcer == null)
			{
				throw new Error("Error: Instantiation failed: Use GlobalDecalSheetManager.instance instead.");
			}
		}
	}
}

internal class SingletonEnforcer
{
}


