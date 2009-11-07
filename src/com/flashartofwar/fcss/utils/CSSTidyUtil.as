package com.flashartofwar.fcss.utils
{

	/**
	 * <p>CSSTidyUtil uses regex to remove spaces, breaks, "px" and other items
	 * that the F*CSS's parser doesn't know how to handle. This also shrinks
	 * the CSS filesize substatually to help speed up parsing.</p>
	 *
	 * <p>In most cases it is better to do this on the server then in Flash at
	 * run time. You can simply take this regex and run it through php or some
	 * other server side language.</p>
	 *
	 * @author jessefreeman
	 */
	public class CSSTidyUtil
	{

		protected static const COMPRESS_CSS:RegExp = /\s*([@{}:;,]|\)\s|\s\()\s*|\/\*([^*\\\\]|\*(?!\/))+\*\/|[\n\r\t]|(px)|(%)/g;

		/**
		 * <p>This uses regex to remove spaces, breaks, "px" and other items
		 * that the F*CSS's parser doesn't know how to handle and returns a clean
		 * string.</p>
		 *
		 * @param cssText
		 * @return
		 */
		public static function tidy(cssText:String):String
		{
			return cssText.replace(COMPRESS_CSS, "$1");
		}
	}
}

