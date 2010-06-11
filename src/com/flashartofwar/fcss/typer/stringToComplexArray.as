package com.flashartofwar.fcss.typer
{
    import flash.utils.Dictionary;

    /**
     * <p>This function parses out a complex array and puts it into an Associate
     * Array, Dictionary, or Object. Use this function to split up the array base
     * on the dataDelimiter (default ",") and the propDelimiter (default ":").</p>
     *
     * <p>Example of a data: "up:play,over:playO,down:playO,off_up:pause,off_over:pauseO,off_down:pauseO"</p>
     *
     */
    public function stringToComplexArray(data:String, returnType:String, dataDelimiter:String = ",", propDelimiter:String = ":"):*
    {

        var dataContainer:*;

        // Determine what type of object to return
        switch (returnType)
        {
            case Types.DICTIONARY:
                dataContainer = new Dictionary();
                break;
            case Types.OBJECT:
                dataContainer = {};
                break;
            default:
                dataContainer = [];
        }

        var list:Array = data.split(dataDelimiter);
        var total:Number = list.length;

        for (var i:Number = 0; i < total; i++)
        {
            var prop:Array = list[i].split(propDelimiter);
            dataContainer[prop[0]] = prop[1];
        }

        return dataContainer;
    }
}