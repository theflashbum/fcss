package com.flashartofwar.fcss.typer
{
    import flash.net.URLRequest;

    public function stringToUrlRequest(value:String):URLRequest
    {
        return new URLRequest(splitTypeFromSource(value).source);
    }
}