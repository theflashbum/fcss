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


---- Introduction ----

F*CSS is a custom CSS parser for Flash. The main class called FStyleSheet (found 
inside of the com.flashartofwar.fcss.stylesheets package), goes well beyond the 
native StyleSheet class by supporting style inheritance, pseudo selectors, and 
merging styles on the fly. The goal of F*CSS is to make styles something you can 
apply to any of your classes instead of just TextFields. CSS is a great way to 
define your class’s properties in an external file and F*CSS helps convert these 
css styles into property/value pairs you can apply to any Object.

---- Examples ----

/** Sample CSS ***/

// Get some css. Normally you would load CSS from an external file but
// for this example we are going to put some CSS in a XML variable.
var css:XML = <css><![CDATA[

/* This is a class */
.TextField
{
    border: true;
    borderColor: red;
    selectable: false;
}

/* This is an ID */
#demoStyle
{
    color: red;
    size: 30;
    autoSize: left;
    x: 50;
    y: 50;
}

/* This is how you can inherit from another style */
#demoStyle #demoStyle2
{
    y:100;
}

#demoStyle #demoTextFieldFactroy
{
    y:160;
    color: green;
    borderColor: green;
}

/* This is how you do inline StyleSheets for TextFields */
#demoStyle #demoInlineStyleSheet
{
    size:25;
    y: 210;
    styleSheet:.highLight,a,a:hover;
}

.highLight
{
    color:#00ff00;
}

a
{
    color:#0000ff;
    text-decoration: underline;
}

a:hover
{
    color:#000000;
    text-decoration: none;
}

#demoShapeStyle
{
    x:50;
    y:10;
    width:300;
    height:25;
}


]]>
</css>;

/** Style A TextField **/

// Create a new StyleSheet
var styleSheet:IStyleSheet = new FStyleSheet( );
styleSheet.parseCSS(css.toString());

// Get a style (Returns an object with properties as strings)
var style:IStyle = styleSheet.getStyle("#demoStyle");

// Trace out the style's properties
trace("style", style);

// Create a TextField
var tf:TextField = new TextField();

// Use a TextFieldApplicator to apply the style to the TextField
var tfApplicator:TextFieldApplicator = new TextFieldApplicator();
tfApplicator.applyStyle(tf, style);

// Use TextField like you would normally
tf.htmlText = "F*CSS - Hello World";
addChild(tf);


/** Merging styles at runtime **/

// You can merge styles on the fly when you call getStyle().
// Here we merge .TextField with #demoStyle2 to setup a new TF.

// Lets get the 2 styles. Simply pass in any number
// of style names and separate them with a comma.
var style2:IStyle = styleSheet.getStyle(".TextField", "#demoStyle2");

// Trace out the style we just created
trace("style2 (Merged .TextField + #demoStyle2)", style2);

// Create a TextField
var tf2:TextField = new TextField();

// Use TextFieldUtility to apply the style to the TextField
tfApplicator.applyStyle(tf2, style2);

// Use TextField like you would normally
tf2.htmlText = "F*CSS Demo 2 - Hello World";
addChild(tf2);

/** How To Use The TextFieldFactory **/

// This assumes you are have created a StyleSheetCollection. If not, you will have to
// create a new FStyleSheet, parse css data then pass that into the factory.

// Create a new factory and pass in a reference to a IStyleSheet and an IApplicator
var tff:TextFieldFactory = new TextFieldFactory(tfApplicator, styleSheetCollection);

// The first param is the id and the second is the calls. It will
// automatically add # and . to the string to "emulate" how
// HTML/CSS would work.
var tf3:TextField = tff.createTextField("demoTextFieldFactroy", "TextField");

// Use TextField like you would normally
tf3.htmlText = "F*CSS TextFactory - Hello World";
addChild(tf3);


/** Add Native StyleSheets To TextField with F*CSS **/

// To use native StyleSheets you simply add the Style names into the
// F*CSS's StyleSheet param on any F*CSS Style. Check out
// .demoInlineStyleSheet to see what I am talking about
var tf4:TextField = tff.createTextField("demoInlineStyleSheet");

// Use TextField like you would normally
tf4.htmlText = "<a href='http://fcss.flashartofwar.com' target='_blank'>F*CSS</a> <span class='highLight'>Native</span> StyleSheet - Hello World";
addChild(tf4);


/** Style Any Object With StyleApplierUtil **/

// For this demo we are going to create a simple shape
// then use CSS to position it and change it's dimensions
var shape:Shape = new Shape();
shape.graphics.beginFill(0xff0000);
shape.graphics.drawRect(0,0,10,10);
shape.graphics.endFill();
addChild(shape);

// Get a Style
var shapeStyle:IStyle = styleSheetCollection.getStyle("#demoShapeStyle");

// Now you can apply the style to any object, lets use the
// shape as our target.
var styleApplicator:StyleApplicator = new StyleApplicator();
styleApplicator.applyStyle(shape,shapeStyle);