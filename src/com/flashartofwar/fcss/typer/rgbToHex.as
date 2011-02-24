package com.flashartofwar.fcss.typer
{

    /**
     * <p>Converts rgb to hex.</p>
     *
     */
    public function rgbToHex(r:Number, g:Number, b:Number):Number
    {
        return r << 16 | g << 8 | b;
    }
}