package com.flashartofwar.fcss.typer
{
    import flash.geom.Point;

    /**
     *
     * @param value
     * @param delimiter
     * @return
     *
     */
    public function stringToPoint(value:String, delimiter:String = " "):Point
    {
        var coords:Array = splitTypeFromSource(value).source.split(delimiter, 2);
        return new Point(Number(coords[0]), Number(coords[1]));
    }
}