package com.flashartofwar.fcss.behaviors {
	import com.flashartofwar.fcss.managers.StyleSheetManager;

	import org.flexunit.Assert;

	public class ApplyStyleBehaviorTest
	{
		
		private var dummyClassA:DummyClass;
		
		private var dummyClassB:DummyClass;
		
		public function get cssText():String
		{
			var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								DummyClass {
									name: DummyClass;
									x:50;
									y:50;
									visible:false;
								}
								.CustomDummyClassName
								{
									z:300;
								}
				
								#dummyClassB{
									y:100;
									visible: true;
								}
				
								#testStyle
								{
									name: testStyle;
									x: 350;
								}
							]]>
				</css>;
			return xml.toString();
		}
		
		[Before(ui)]
		public function runBeforeEachTest():void
		{
			StyleSheetManager.collection.parseCSS(cssText);
			
			dummyClassA = new DummyClass();
			dummyClassB = new DummyClass("dummyClassB", "CustomDummyClassName");
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
			dummyClassA.applyStyle(StyleSheetManager.collection.getStyle("#testStyle"));
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
		public function getDefaultStyleNames():void
		{
			Assert.assertEquals(dummyClassB.defaultStyleNames.join(), "DummyClass,.CustomDummyClassName,#dummyClassB");
		}
	}
}

import com.flashartofwar.fcss.styles.IStyle;
import com.flashartofwar.fcss.behaviors.IApplyStyleBehavior;
import com.flashartofwar.fcss.behaviors.ApplyStyleBehavior;

import flash.display.Sprite;

class DummyClass extends Sprite
{
	
	private var styleBehavior:IApplyStyleBehavior;
	
	public function DummyClass(id:String = "dummyClass", styleClass:String = null)
	{
		styleBehavior = createStyleBehavior(this, id, styleClass);
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
	
	private function createStyleBehavior(target:Object, styleID:String, styleClass:String = null):IApplyStyleBehavior
	{
		return new ApplyStyleBehavior(this, styleID, styleClass);
	}
}