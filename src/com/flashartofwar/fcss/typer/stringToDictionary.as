package com.flashartofwar.fcss.typer
{
    import flash.utils.Dictionary;

    /**
     *
     */
    public function stringToDictionary(value:String):Dictionary
    {
        return stringToComplexArray(value, Types.DICTIONARY);
    }
}