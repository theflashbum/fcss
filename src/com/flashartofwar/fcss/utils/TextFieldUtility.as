
/** 
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: TextFieldUtility.as</p>
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
 *      2.0  Initial version Jan 7, 2009</p>
 *
 */

package com.flashartofwar.fcss.utils {
	import com.flashartofwar.fcss.enum.TextFieldProperties;
	import com.flashartofwar.fcss.enum.TextFormatProperties;
	import com.flashartofwar.fcss.styles.IStyle;

	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;

	public class TextFieldUtility {

		private static const STYLE_SHEET : String = "styleSheet";
		private static var textFieldConfigCache : Dictionary = new Dictionary(true);

		public static function applyStyle(textField : TextField, style : IStyle) : void {
			
			//			trace("Converting style", style.toString());
			//			var tfs : TextFieldStyle = convertStyleToTextFieldConfig(style);
			//			applyStyleToTextField(textField, tfs);

			var text : String = textField.text;			var htmlText : String = textField.htmlText;
			
			var textFormat : TextFormat = new TextFormat();
			var camelCasePropName : String;
			var prop : String;
			var value : String;
               
			for (prop in style) {
				
				camelCasePropName = camelize(prop, "-");
				value = style[prop];
				trace("Prop", prop, "~", camelCasePropName, ":", "value", value);
				
				if(TextFieldProperties.isSupported(camelCasePropName)) {
					trace("Is TextFieldProperty", camelCasePropName);
					textField[camelCasePropName] = TextFieldProperties.cleanupProp(camelCasePropName, value);
				}
                else if (TextFormatProperties.isSupported(camelCasePropName)) {
					trace("Is TextFormatProperty", camelCasePropName);
					textFormat[TextFormatProperties.convertProp(camelCasePropName)] = TextFormatProperties.cleanupProp(camelCasePropName, value);
				}
//				else if (camelCasePropName == "styleSheet") {
//					trace("Is StyleSheet");
//					if(value) {
//						var tempStyleSheet : StyleSheet = new StyleSheet();
//						tempStyleSheet.parseCSS(value);
//						this["styleSheet"] = tempStyleSheet;
//					} else {
//						trace("There was no CSS to parse");
//					}
//				} else {
//					trace(prop, " is not supported");
//				}
			}
			
			textField.setTextFormat(textFormat);
			/*
			if(text) textField.text = text;
			if(htmlText) textField.htmlText = htmlText;
			 
			 */
		}

		/**
		 * 
		 * @param style
		 * @return 
		 * 
		 */             
		//		protected static function convertStyleToTextFieldConfig(style : IStyle) : TextFieldStyle {
		//			//FIXME this may be intensive and pointless to cache since the clone calls transform itself
		//			if(style) {
		//				var id : String = style.selectorName;
		//				var tfConfig : TextFieldStyle;
		//                                
		//				if(textFieldConfigCache[id]) {
		//					// Created From Cache
		//					tfConfig = textFieldConfigCache[style.selectorName];
		//				} else {
		//					// Created From Scratch
		//					trace("Creating from scratch");
		//					tfConfig = new TextFieldStyle();
		//					tfConfig.transform(style);
		//					textFieldConfigCache[style.selectorName] = tfConfig;
		//				}
		//			} else {
		//				// This is a last ditch effort to return an Empty TextFieldModel in case there is no style.
		//				tfConfig = new TextFieldStyle();             
		//			}
		//                        
		//			return tfConfig;
		//		}

		/**
		 * 
		 * @param target
		 * @param template
		 * @return 
		 * 
		 */             
		//		public static function applyStyleToTextField(target : TextField, template : TextFieldStyle) : TextField {
		//                        
		//			// FIXME Due to a strange bug in Flash where you can't apply a 
		//			// styleSheet at the same time as a TextFormat I have to strip it 
		//			// out, then apply it after the TextField has been created. Is there
		//			// a better work around for this?
		//			var tempStyleSheet : StyleSheet;
		//			              
		//			// Strip out cssSheet
		//			if(template["styleSheet"]) {
		//				tempStyleSheet = template["styleSheet"];
		//				delete(template["styleSheet"]);
		//				target.styleSheet = null;       
		//			}
		//                                   
		//			mergeClass(target, template);
		//                        
		//			// Reapply StyleSheet
		//			if(tempStyleSheet) {
		//				target.styleSheet = tempStyleSheet;
		//			}
		//           
		//			return target;
		//		}

		//		private static function mergeClass(c1 : Object,c2 : Object) : Object {
		//			
		//			for(var j:String in c2) {
		//				if(c1.hasOwnProperty(j))
		//				{
		//					trace("Applying new property", j);
		//					
		//					c1[j] = c2[j];
		//				}
		//			}
		//			return c1;
		//		}
		//TODO also need some way to fix trace so TextFormat and StyleSheet come out right
		
		
		/**
		 * <p>Returns given lowercaseandunderscoreword as a camelCased word.</p>
		 *
		 * @param string lowercaseandunderscoreword Word to camelize
		 * @return string Camelized word. likeThis.
		 */
		private static function camelize(lowercaseandunderscoreword : String, deimiter : String = "-") : String {
			var tarray : Array = lowercaseandunderscoreword.split(deimiter);
			
			for (var i : int = 1;i < tarray.length; i++ ) {
				tarray[i] = ucfirst(tarray[i] as String);
			}
			var replace : String = tarray.join("");
			return replace;
		}

		/**
		 * <p>Make first character of word upper case</p>
		 * @param	word
		 * @return string
		 */
		private static function ucfirst(word : String) : String {
			return word.substr(0, 1).toUpperCase() + word.substr(1);
		}
	}
}