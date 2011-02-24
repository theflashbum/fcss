package com.flashartofwar.fcss.typer
{
    import com.flashartofwar.fcss.enum.ColorsByName;

    /**
     * <p>Converts a string into a uint. This function also supports converting
     * colors into .</p>
     */
    public function stringToUint(value:String):uint
    {
        // Check to see if it is a registered color
        if (ColorsByName.isSupported(value))
        {
            return ColorsByName.convertColor(value);
        }
        else
        {
            value = value.substr(-6, 6);
            var color:uint = Number("0x" + value);
            return color;
        }
    }
}