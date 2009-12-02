Copyright (c) 2009 Jesse Freeman http://www.flashartofwar.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


** Introduction **

F*CSS is a custom CSS parser for Flash. The main class called FStyleSheet (found 
inside of the com.flashartofwar.fcss.stylesheets package), goes well beyond the 
native StyleSheet class by supporting style inheritance, pseudo selectors, and 
merging styles on the fly. The goal of F*CSS is to make styles something you can 
apply to any of your classes instead of just TextFields. CSS is a great way to 
define your class’s properties in an external file and F*CSS helps convert these 
css styles into property/value pairs you can apply to any Object.

** Examples **

You can download the FCSSExamples project from GitHub here:

http://github.com/theflashbum/fcss-examples

If you don't have time to get those, here are a few simple examples to get up
and running quickly.

** CSS Sample **
// Get some css. Normally you would load CSS from an external file but
// for this example we are going to put some CSS in a XML variable.
 
var css:XML = <css><![CDATA[
 
demoStyle
{
	autoSize: left;
	border: true;
	border-color: red;
	color: red;
	size: 30px;
	selectable: false;
	x: 50px;
	y: 50px;
}
]]>
</css>;

** Style A TextField **

// Create a new StyleSheet
var styleSheet:IStyleSheet = new FStyleSheet( );
styleSheet.parseCSS(css.toString());

// Get a style (Returns an object with properties as strings)

var style:IStyle = styleSheet.getSelector("demoStyle");

// Create a TextField
var tf:TextField = new TextField();

// Use TextFieldUtility to apply the style to the TextField
TextFieldUtil.applyStyle(tf, style);

// Use TextField like you would normally
tf.htmlText = "F*CSS - Hello World";
addChild(tf);

** Global StyleSheetManager **

// If you want to make the CSS available globally use the 
// StyleSheetManager/StyleSheetCollection
                        
// Get a reference of the StyleSheetCollection from the StyleSheetManager
var styleSheetCollection:IStyleSheetCollection = StyleSheetManager.collection;
                        
// Register style sheet with the Collection.
styleSheetCollection.addStyleSheet(styleSheet, "defaultSheet");
                        
trace(styleSheetCollection.getSelector("demoStyle"));

** TextFieldFactory **
// In order to have the TextFieldFactory work you must have at least 1 StyleSheet
in the StyleSheetManager.

// The first param is the id. It will add # to the string to provide like HTML/CSS
var textField:TextField = TextFieldFactory.createTextField("demoStyle", "TextField");

** Apply Style to any object **

// Get a Style
var demoStyle:IStyle = StyleSheetManager.collection.getStyle("demoStyle");

// This can be any class
StyleApplierUtil.applyProperties(*AnyClassInstanceGoesHere*,demoStyle); 
