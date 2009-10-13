package com.flashartofwar.fcss.utils
{

	/**
	 *
	 * @author jessefreeman
	 */
	public class CSSTidyUtil
	{
		/**
		 *
		 * @default
		 */
		public static const COMPRESS_CSS:RegExp = /\s*([@{}:;,]|\)\s|\s\()\s*|\/\*([^*\\\\]|\*(?!\/))+\*\/|[\n\r\t]|(px)/g;

		/**
		 *
		 * @param cssText
		 * @return
		 */
		public static function tidy(cssText:String):String
		{
			return cssText.replace(COMPRESS_CSS, "$1");
			;
		}
	}
}