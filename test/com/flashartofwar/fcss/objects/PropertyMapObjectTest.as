package com.flashartofwar.fcss.objects
{
	import com.flashartofwar.fcss.objects.PropertyMapObject;

	import flexunit.framework.TestCase;
	
	import flexunit.framework.Assert;
	
	public class PropertyMapObjectTest
	{
		// please note that all test methods should start with 'test' and should be public

		// Reference declaration for class to test
		private var classToTestRef : com.flashartofwar.fcss.objects.PropertyMapObject;
		private var propMap:PropertyMapObject;

		public function PropertyMapObjectTest()
		{
		}

		[Before(ui)]
		public function runBeforeEachTest():void
		{
			propMap = new PropertyMapObject();
			propMap.propA = "string";
			propMap.propB = "number";
			propMap.propC = "number";
			propMap.propC = "number";
			propMap.propC = "array";
		}

		[After(ui)]
		public function runAfterEachTest():void
		{
		}
		
		[Test]
		public function testClone():void
		{
			var clone:PropertyMapObject = propMap.clone();
			Assert.assertEquals(propMap.toString(), propMap.toString());
		}
		
		[Test]
		public function testGetPropsByTypes():void
		{
			Assert.assertEquals(propMap.getPropsByTypes("string", "number").length,4); 
		}
		
		[Test]
		public function testToString():void
		{
			var propMapAsString:String = "{propA:string;propB:number;propC:array;}";
			Assert.assertEquals(propMap.toString(), propMapAsString);
		}
		
		[Test]
		public function testGetPropsByTypesReturnsCleanArray():void
		{
			var props:Array = propMap.getPropsByTypes("string", "number");
			props.length = 0;

			var props2:Array = propMap.getPropsByTypes("string", "number");
			Assert.assertEquals(props2.length, 4);
		}
	}
}

