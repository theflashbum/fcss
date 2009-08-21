
package com.flashartofwar.fcss.utils 
{
	import com.flashartofwar.fcss.styles.Style;
	import com.flashartofwar.fcss.styles.PropertyMap;

	import flash.utils.Dictionary;
	import flash.utils.describeType;

	public class StyleApplierUtil 
	{

		protected static var cachedPropertyMaps : Dictionary = new Dictionary( true );

		/**
		 * 
		 * @param target
		 * @return 
		 * 
		 */		
		private static function scan(target : Object) : XML 
		{
			var classXML : XML = describeType( target );
			return classXML;
		}

		/**
		 * 
		 * @param target
		 * @return 
		 * 
		 */			
		public static function propertyMap(target : Object) : PropertyMap 
		{
			var propMap : PropertyMap = new PropertyMap( );
			
			var classXML : XML = scan( target );
			var className : String = classXML.@name;
			
			if(! cachedPropertyMaps[className]) 
			{
				var list : XMLList = classXML.*;
				
				var item : XML;
				for each (item in list) 
				{
					var itemName : String = item.name( ).toString( );
					switch(itemName) 
					{
						case "variable":
							propMap[item.@name.toString( )] = item.@type.toString( );
							break;
						case "accessor":
							var access : String = item.@access;
							if((access == "readwrite") || (access == "writeonly")) 
							{
								propMap[item.@name.toString( )] = item.@type.toString( );
							}
							break;
					}
					
					cachedPropertyMaps[className] = propMap; 
				}
			} 
			else 
			{
				propMap = cachedPropertyMaps[className];
			}
			
			return propMap.clone( ) as PropertyMap;
		}

		/**
		 * 
		 */		
		public static function propertyMapCollection( ... targets ) : Dictionary 
		{
			var collection : Dictionary = new Dictionary( true );
			var total : int = targets.length;
			var i : int;
			
			for (i = 0; i < total; i ++) 
			{
				collection[targets[i]] = propertyMap( targets[i] );
			}
			
			return collection;
		}

		/**
		 * 
		 */		
		public static function applyProperties( target : Object, properties : Style) : void 
		{
			var propMap : PropertyMap = propertyMap( target );
			
			for(var prop:String in properties) 
			{

				if(target.hasOwnProperty( prop )) 
				{
					
					var type : String = propMap[prop];
					var cleanedUpValue : * = TypeHelperUtil.getType( properties[prop], type );
					
					target[prop] = cleanedUpValue;
				}
			}
		}
	}
}