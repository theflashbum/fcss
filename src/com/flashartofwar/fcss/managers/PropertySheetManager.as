/** 
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: CamoStyleSheetLibrary.as</p>
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
 * 	2.0  Initial version Jan 19, 2009</p>
 *
 */

package com.flashartofwar.fcss.managers {
	import com.flashartofwar.fcss.property.IPropertySheet;
	import com.flashartofwar.fcss.property.PropertySelector;
	import com.flashartofwar.fcss.property.PropertySheet;

	public class PropertySheetManager
	{
		public var styleSheets : Array = [];

		/**
		 * 
		 * @param enforcer
		 * 
		 */		
		public function PropertySheetManager() 
		{
		}

		/**
		 * 
		 * @param selectorName
		 * @return 
		 * 
		 */		
		public function getSelector( ... selectorNames) : PropertySelector
		{
			var tempProperties : PropertySelector = new PropertySelector( );
			
			for each (var styleSheet:IPropertySheet in styleSheets)
			{
				var sheetProperties : PropertySelector = styleSheet.getSelector.apply( null, selectorNames );
				if(sheetProperties.selectorName != "EmptyProperties")
					tempProperties.merge( sheetProperties );	
			}
			
			return tempProperties; 
		}

		/**
		 * 
		 * @return 
		 * 
		 */		
		protected function createPropertySheet() : IPropertySheet
		{
			return new PropertySheet( );
		}

		/**
		 * 
		 * @param id
		 * @param sheet
		 * 
		 */		
		public function addPropertySheet(id : String, sheet : IPropertySheet) : void
		{
			styleSheets[id] = sheet;
		}
		
		/**
		 * 
		 * @param id
		 */
		public function getPropertySheet(id:String):IPropertySheet
		{
			return styleSheets[id];	
		}

		/**
		 * 
		 * @param id
		 * 
		 */		
		public function removePropertySheet(id : String) : void
		{
			styleSheets[id] = null;
			delete styleSheets[id];
		}

		/**
		 * 
		 * @param id
		 * @param CSSText
		 * 
		 */		
		public function parseCSS(id : String, CSSText : String, compressText : Boolean = true) : void
		{
			var sheet : IPropertySheet = createPropertySheet( );
			sheet.parseCSS( CSSText, compressText );
				
			addPropertySheet( id, sheet );
		}
	}
}