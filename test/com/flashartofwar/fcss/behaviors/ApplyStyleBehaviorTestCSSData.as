package com.flashartofwar.fcss.behaviors
{
    public class ApplyStyleBehaviorTestCSSData
    {
        public static function get cssText():String
        {
            var xml:XML = <css>
                <![CDATA[/* This is a comment in the CSS file */
            DummyClass {
                    name: DummyClass;
                    x:50;
                    y:50;
                    visible:false;
                    }
            .CustomDummyClassName
            {
                    z:300;
                    }

            #dummyClassB{
                    y:100;
                    visible: true;
                    }

            #testStyle
            {
                    name: testStyle;
                    x: 350;
                    }

            #dummyClassB:over
            {
                    y: 600;
                    }

            ]]>
            </css>;
            return xml.toString();
        }
    }
}