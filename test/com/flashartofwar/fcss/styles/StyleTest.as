package com.flashartofwar.fcss.styles
{
    import org.flexunit.Assert;

    public class StyleTest
    {
        private static const style_NAME:String = "teststyle";
        private var style:Style;

        public function StyleTest()
        {
        }

        [Before(ui)]
        public function runBeforeEachTest():void
        {
            style = new Style();
            style.styleName = style_NAME;
            style.propA = "a";
            style.propB = "b";
            style.propC = "c";

        }

        [Test]
        public function testClone():void
        {
            var clone:IStyle = style.clone();
            Assert.assertEquals(clone.toString(), style.toString());

        }

        [Test]
        public function testGet_styleName():void
        {
            // Add your test logic here
            Assert.assertEquals(style.styleName, style_NAME);
        }

        [Test]
        public function testSet_styleName():void
        {
            style.styleName = style_NAME + "Renamed";
            Assert.assertEquals(style.styleName, style_NAME + "Renamed");
        }

        [Test]
        public function testToString():void
        {
            var styleAsString:String = "teststyle{styleName:teststyle;propA:a;propB:b;propC:c;}";

            Assert.assertEquals(style.toString(), styleAsString);
        }

        [Test]
        private function getPropertyArray():Array
        {
            var prop:String;
            var props:Array = [];
            for (prop in style)
            {
                props.push(prop);
            }
            return props;
        }

        [Test]
        public function testPropertyOrder():void
        {

            var props:Array = getPropertyArray();

            // Add your test logic here
            Assert.assertEquals(props.indexOf("propB"), 2);
        }

        [Test]
        public function testMergestyleName():void
        {

            var newStyle:Style = new Style();
            newStyle.styleName = style_NAME + "Merge";

            style.merge(newStyle);

            Assert.assertEquals(style.styleName, style_NAME + "Merge");
        }

        [Test]
        public function testMergeNewProperty():void
        {

            var newStyle:Style = new Style();
            newStyle.propQ = "q";

            style.merge(newStyle);

            Assert.assertTrue(style.hasOwnProperty("propQ"));
        }

        [Test]
        public function testMergeSameProperty():void
        {

            var newStyle:Style = new Style();
            newStyle.propA = "a2";

            style.merge(newStyle);

            Assert.assertEquals(style.propA, "a2");
        }

        [Test]
        public function testAddProperty():void
        {
            style.propZ = "z";
            Assert.assertTrue(style.hasOwnProperty("propZ"));
        }

        [Test]
        public function testPropertyOrderAfterAdding():void
        {
            style.propZ = "z";

            var props:Array = getPropertyArray();

            Assert.assertTrue(props.indexOf("propZ"), (props.length - 1));

        }

        [Test]
        public function testDeleteProperty():void
        {
            delete style.propA;
            Assert.assertFalse(style.hasOwnProperty("propA"));
        }

        [Test]
        public function testPropertyOrderAfterDelete():void
        {
            delete style.propB;

            var props:Array = getPropertyArray();

            Assert.assertTrue(props.indexOf("propC"), (2));
        }

        [Test(expected="Error")]
        public function testSettingNonStringAsProp():void
        {
            style.nonStringProp = 5;
        }

    }
}

