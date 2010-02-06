package com.flashartofwar.fcss.managers
{
import com.flashartofwar.fcss.styles.IStyle;
import com.flashartofwar.fcss.stylesheets.FStyleSheet;
import com.flashartofwar.fcss.stylesheets.IStyleSheet;

import org.flexunit.Assert;

/**
 * @author jessefreeman
 */
public class SingletonManagerTest
{

    public function get cssText():String
    {
        var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								.TextField
								{
									alwaysShowSelection: true;
									antiAliasType: advanced;
									autoSize: center;
									background: true;
									backgroundColor: blue;
									border: true;
									borderColor: red;
									condenseWhite: true;
									displayAsPassword: true;
									embedFonts: true;
									gridFitType: true;
									maxChars: 100;
									mouseWheelEnabled: true;
									multiline: true;
									restrict: A-Z 0-9;
									selectable: true;
									sharpness: 50;
									textColor: red;
									thickness: 100;
									wordWrap: true;
									width: 50;
									height: 50;
									alpha: .5;
									x: 100;
									y: 50;
									rotation: 20;
									styleSheet: a;
								}

								#DemoTextField
								{
									align: center;
									blockIndent: 10;
									bold: true;
									bullet: true;
									color: red;
									font: Times New Roman;
									indent: 10;
									italic: true;
									kerning: true;
									leading: 10;
									leftMargin: 10;
									letterSpacing: 10;
									rightMargin: 10;
									size: 10;
									underline: true;
								}

								a{color:#ff0000}

							]]>
        </css>;
        return xml.toString();
    }

    [Test]
    public function testSingleton():void
    {
        var sheet:IStyleSheet = SingletonManager.getClassReference(FStyleSheet) as IStyleSheet;
        sheet.parseCSS(cssText);

        var sheet2:IStyleSheet = SingletonManager.getClassReference(FStyleSheet) as IStyleSheet;


        var style:IStyle = sheet2.getStyle("a");

        Assert.assertEquals(style.toString(), "a{styleName:a;color:#ff0000;}");
    }
}
}
