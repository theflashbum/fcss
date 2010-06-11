package typer
{
    public function stringToObject(value:String):Object
    {
        return stringToComplexArray(value, Types.OBJECT);
    }
}