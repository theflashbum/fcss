package com.flashartofwar.fcss.utils {
	import com.flashartofwar.fcss.objects.PropertyMapObject;
	import com.flashartofwar.fcss.styles.Style;

import com.flashartofwar.fcss.utils.PropertyMapUtil;

import flash.display.Sprite;

import org.flexunit.Assert;

	public class PropertyMapUtilTest
	{

		[Test]
        public function testPropertyMapObject():void
		{
            var propertyMap:PropertyMapObject = PropertyMapUtil.propertyMap(Sprite);
			var pass:Boolean = ((propertyMap.name == "string") && (propertyMap.x == "number") && (propertyMap.y == "number"));
			Assert.assertTrue(pass);
		}
	}
}