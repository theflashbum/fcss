package com.flashartofwar.fcss.utils
{
	public class CSSTidyUtil
	{
		public static const COMPRESS_CSS : RegExp = /\s*([@{}:;,]|\)\s|\s\()\s*|\/\*([^*\\\\]|\*(?!\/))+\*\/|[\n\r\t]|(px)/g;
		
		public static function tidy(cssText:String):String
		{
			return cssText.replace( COMPRESS_CSS, "$1" );;
		}
	}
}