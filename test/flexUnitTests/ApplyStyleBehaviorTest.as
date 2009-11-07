package flexUnitTests
{
	import com.flashartofwar.fcss.behaviors.ApplyStyleBehavior;
	import com.flashartofwar.fcss.managers.StyleSheetManager;
	import com.flashartofwar.fcss.styles.Style;

	import flash.display.Sprite;

	import flexunit.framework.TestCase;

	public class ApplyStyleBehaviorTest extends TestCase
	{
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef:com.flashartofwar.fcss.behaviors.ApplyStyleBehavior;

		private var dummyClassA:DummyClass;

		private var dummyClassB:DummyClass;

		public function ApplyStyleBehaviorTest(methodName:String = null)
		{
			//TODO: implement function
			super(methodName);
		}

		public function get cssText():String
		{
			var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								.DummyClass {
									name: DummyClass;
									x:50px;
									y:50px;
									visible:false;
								}
								
								#dummyClassB{
									y:100;
									visible: true;
								}
				
								#testStyle
								{
									name: testStyle;
									x: 350px;
								}
							]]>
				</css>;
			return xml.toString();
		}

		//This method will be called before every test function
		override public function setUp():void
		{
			//TODO: implement function
			super.setUp();

			StyleSheetManager.instance.parseCSS(cssText);

			dummyClassA = new DummyClass();
			dummyClassB = new DummyClass("dummyClassB");
		}

		//This method will be called after every test function
		override public function tearDown():void
		{
			super.tearDown();
			dummyClassA = null;
			dummyClassB = null;
		}

		public function testApplyDefaultStyle():void
		{
			assertEquals(dummyClassA.name, "DummyClass");
		}

		public function testApplyStyle():void
		{
			dummyClassA.applyStyle(StyleSheetManager.instance.getStyle("#testStyle"));
			assertEquals(dummyClassA.x, 350);
		}

		public function testGet_className():void
		{
			// Add your test logic here
			assertEquals(dummyClassA.className, "DummyClass");
		}

		public function testGet_id():void
		{
			// Add your test logic here
			assertEquals(dummyClassB.id, "dummyClassB");
		}

	}
}
import com.flashartofwar.fcss.behaviors.ApplyStyleBehavior;
import com.flashartofwar.fcss.styles.Style;

import flash.display.Sprite;

class DummyClass extends Sprite
{

	private var styleBehavior:ApplyStyleBehavior;

	public function DummyClass(id:String = "dummyClass")
	{
		createStyleBehavior(id);
	}

	public function applyStyle(style:Style):void
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

	private function createStyleBehavior(id:String):void
	{
		styleBehavior = new ApplyStyleBehavior(id, this);
	}
}

