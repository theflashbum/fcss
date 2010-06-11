package com.flashartofwar.fcss.utils
{
    import com.flashartofwar.fcss.objects.PropertyMapObject;

    import org.flexunit.Assert;

    public class PropertyMapUtilTest
    {

        [Test]
        public function testPropertyMapObject():void
        {
            var propertyMap:PropertyMapObject = PropertyMapUtil.propertyMap(DummyClass);
            var pass:Boolean = ((propertyMap.name == "string") && (propertyMap.speed == "number") && (propertyMap.items == "array"));
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

