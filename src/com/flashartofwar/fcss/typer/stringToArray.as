package com.flashartofwar.fcss.typer
{
    /**
     * By default this method is set up to convert CSS style arrays delimited by spaces.
     */
    public function stringToArray(value:String, delimiter:String = " "):Array
    {
        return value.split(delimiter);
    }
}