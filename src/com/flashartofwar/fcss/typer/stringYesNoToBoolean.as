package com.flashartofwar.fcss.typer
{
    /**
     * <p>Use this to turn Yes No values into True or False.</p>
     *
     *    @param value Accepts "yes" for true or "no" for false.
     */
    public function stringYesNoToBoolean(value:String):Boolean
    {
        if (value.toLowerCase() == "yes")
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}