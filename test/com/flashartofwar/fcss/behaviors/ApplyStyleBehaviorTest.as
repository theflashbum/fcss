package com.flashartofwar.fcss.behaviors
{
    import com.flashartofwar.fcss.styles.IStyle;
    import com.flashartofwar.fcss.stylesheets.IStyleSheetCollection;
    import com.flashartofwar.fcss.stylesheets.StyleSheetCollection;

    import org.flexunit.Assert;

    public class ApplyStyleBehaviorTest
    {

        private var dummyClassA:DummyClass;

        private var dummyClassB:DummyClass;

        private var collection:IStyleSheetCollection = new StyleSheetCollection();

        [Before(ui)]
        public function runBeforeEachTest():void
        {
            collection.parseCSS(ApplyStyleBehaviorTestCSSData.cssText);

            dummyClassA = new DummyClass(collection);
            dummyClassB = new DummyClass(collection, "dummyClassB", "CustomDummyClassName");
        }

        [After(ui)]
        public function runAfterEachTest():void
        {
            dummyClassA = null;
            dummyClassB = null;
        }

        public function ApplyStyleBehaviorTest()
        {
        }

        [Test]
        public function testApplyDefaultStyle():void
        {
            Assert.assertEquals(dummyClassA.name, "DummyClass");
        }

        [Test]
        public function testApplyStyle():void
        {
            dummyClassA.applyStyle(collection.getStyle("#testStyle"));
            Assert.assertEquals(dummyClassA.x, 350);
        }

        [Test]
        public function testGetClassName():void
        {
            // Add your test logic here
            Assert.assertEquals(dummyClassA.className, "DummyClass");
        }

        [Test]
        public function testGetId():void
        {
            // Add your test logic here
            Assert.assertEquals(dummyClassB.id, "dummyClassB");
        }

        [Test]
        public function testGetZ():void
        {
            Assert.assertEquals(dummyClassB.z, 300);
        }

        [Test]
        public function testGetDefaultStyleNames():void
        {
            Assert.assertEquals(dummyClassB.defaultStyleNames.join(), "DummyClass,.CustomDummyClassName,#dummyClassB");
        }

        [Test]
        public function testApplyDefaultStylePseudoSelector():void
        {
            dummyClassB.applyDefaultStyle("over");
            Assert.assertEquals(dummyClassB.y, 600);
        }

        [Test]
        public function testApplyDefaultStyleFromPseudoSelector():void
        {
            dummyClassB.applyDefaultStyle("over");
            dummyClassB.applyDefaultStyle();
            Assert.assertEquals(dummyClassB.y, 100);
        }

        [Test]
        public function testApplyDefaultStyleFromEmptyPseudoSelector():void
        {
            dummyClassB.applyDefaultStyle("up");
            Assert.assertEquals(dummyClassB.y, 100);
        }

        [Test]
        public function testForEmptyStyle():void
        {
            var style:IStyle = collection.getStyle("DummyClass", "#dummyClassB", "bla");
            Assert.assertEquals(style.styleName, "#dummyClassB");
        }


    }
}


import com.flashartofwar.fcss.applicators.StyleApplicator;
import com.flashartofwar.fcss.behaviors.ApplyStyleBehavior;
import com.flashartofwar.fcss.behaviors.IApplyStyleBehavior;
import com.flashartofwar.fcss.styles.IStyle;
import com.flashartofwar.fcss.stylesheets.IStyleSheet;

import flash.display.Sprite;

class DummyClass extends Sprite implements IApplyStyleBehavior
{

    private var styleBehavior:IApplyStyleBehavior;
    private var _z:Number;

    public function DummyClass(styleSheet:IStyleSheet, id:String = "dummyClass", styleClass:String = null)
    {
        styleBehavior = createStyleBehavior(this, styleSheet, id, styleClass);
    }

    public function applyStyle(style:IStyle):void
    {
        styleBehavior.applyStyle(style);
    }

    public function get className():String
    {
        return styleBehavior.className;
    }

    public function get id():String
    {
        return styleBehavior.id;
    }

    public function get defaultStyleNames():Array
    {
        return styleBehavior.defaultStyleNames;
    }

    private function createStyleBehavior(target:Object, styleSheet:IStyleSheet, styleID:String, styleClass:String = null):IApplyStyleBehavior
    {
        return new ApplyStyleBehavior(this, new StyleApplicator(), styleSheet, styleID, styleClass);
    }

    public function applyDefaultStyle(pseudoSelector:String = null):void
    {
        styleBehavior.applyDefaultStyle(pseudoSelector);
    }

    public function getPseudoSelector(state:String):IStyle
    {
        return styleBehavior.getPseudoSelector(state);
    }

    public function get z():Number
    {
        return _z;
    }

    public function set z(value:Number):void
    {
        _z = value;
    }
}