package com.flashartofwar.fcss.typer
{
    import flash.text.StyleSheet;

    /**
     *
     * @param value
     * @return
     *
     */
    public function stringToStyleSheet(value:String):StyleSheet
    {

        var styleSheet:StyleSheet = new StyleSheet();
        styleSheet.parseCSS(value);
        return styleSheet;
    }
}