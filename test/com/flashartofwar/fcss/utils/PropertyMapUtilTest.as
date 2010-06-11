package com.flashartofwar.fcss.utils
{
    import com.flashartofwar.fcss.objects.PropertyMapObject;

    import org.flexunit.Assert;

    import com.flashartofwar.fcss.typer.Types;

    public class PropertyMapUtilTest
    {

        [Test]
        public function testPropertyMapObject():void
        {
            var propertyMap:PropertyMapObject = PropertyMapUtil.propertyMap(DummyClass);
            var pass:Boolean = ((propertyMap["name"] == Types.STRING) && (propertyMap["speed"] == Types.NUMBER) && (propertyMap["items"] == Types.ARRAY));
            Assert.assertTrue(pass);
        }
    }
}

class DummyClass
{

    public function DummyClass()
    {
        // Does nothing
    }

    public var items:Array;
    public var name:String;
    public var speed:Number;
}

