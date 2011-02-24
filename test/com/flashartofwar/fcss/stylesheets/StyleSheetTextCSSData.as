package com.flashartofwar.fcss.stylesheets
{
    public class StyleSheetTextCSSData
    {


        public function StyleSheetTextCSSData()
        {
        }

        public static function get cssTextA():String
        {
            var xml:XML = <css>
                <![CDATA[/* This is a comment in the CSS file */
            @variables
            {
                    defaultColor: #333333;
                    }

            baseStyle {
                    x: 10;
                    y: 10;
                    width: 100px;
                    height: 100%;
                    padding: 5;
                    margin: 10;
                    }

            baseStyle .Button{
                    x: 0px;
                    y: 0px;
                    background-color: #000000;
                    }

            #playButton {
                    background-color: #FFFFFF;
                    background-image: url('/images/play_button_background.jpg');
                    }

            #playButton:over {
                    background-color: var(defaultColor);
                    }

            interactive {
                    cursor: hand;
                    }

            baseStyle interactive .SimpleButton
            {
                    width: 100;
                    height: 100;
                    }
            ]]>
            </css>;

            return xml.toString();
        }


        public static function get cssTextB():String
        {
            var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */

                                        @variables
                                        {
                                                test2: FooBar;
                                                }

                                baseStyle {
                                        x: 300;
                                        height: 150px;
                                        margin: 0;
                                        }

                                extraStyle
                                {
                                        debug: true;
                                        }


                                ]]>
            </css>;
            return xml.toString();
        }


    }
}