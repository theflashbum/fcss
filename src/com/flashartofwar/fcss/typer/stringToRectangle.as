package com.flashartofwar.fcss.typer
{
    import flash.geom.Rectangle;

    /**
     *
     * @param value
     * @param delimiter
     * @return
     *
     */
    public function stringToRectangle(value:String, delimiter:String = " "):Rectangle
    {
        var coords:Array = splitTypeFromSource(value).source.split(delimiter, 4);

        if ((value == "") || (coords.length != 4))
        {
            return null;
        }
        else
        {
            return new Rectangle(coords[0], coords[1], coords[2], coords[3]);
        }
    }
}