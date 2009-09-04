
package com.flashartofwar.fcss.utils 
{
	import flash.utils.getTimer;

	/**
	 * @author jessefreeman
	 */
	public class TextInlineStyleFormatter 
	{

		public static var debug : Boolean;
		public static var openFlag : Boolean;
		public static var closeFlag : Boolean;
		public static var newTag:Boolean;
		public static var tagsFound : int;
		public static var startSelection : int;
		public static var endSelection : int;
		private static var currentText : String;

		public static function formatText(htmlText : String) : String
		{
			currentText = htmlText;
			
			parseHTMLText( currentText );
			trace("tagsFound", tagsFound);
			return htmlText;
		}

		private static function parseHTMLText(htmlText : String) : void
		{
			tagsFound = 0;
			startSelection = 0;
			endSelection = 0;
			
			var t : Number = getTimer( );
			var total : int = htmlText.length;
			var i : int;
			
			for (i = 0; i < total ; i ++) 
			{
				analyzeCharacter( htmlText.charAt( i ), i );
			}
			
			if(debug)
			{
				t = (getTimer( ) - t);
				var strDebug : String;
				strDebug = "parsing time: " + t + " ms\n";
				strDebug += "bytes: " + total + " (" + Math.round( total / t ) + " bytes/ms)\n--\n";
				trace( strDebug );
			}
		}

		private static function analyzeCharacter(char : String, position : int) : void
		{
			switch(char)
			{
				
				case "<":
					//Open Tag
					newTag = true;
					break;
				case ">":
					//End of Open Tag
					
					if(closeFlag){
						closeFlag = false;
						endSelection = position+1;
						tagsFound ++;
						applyFormatting( startSelection, endSelection );
					}
					
					break;
				case "/":
					// Close Marger
					if(newTag){
						newTag = false;
						closeFlag = true;
						trace("New Close Tag");
					}
						break;
				default:
					if(newTag){
						newTag = false;
						openFlag = true;
						trace("New Tag");
					
						startSelection = position-1;
					}
						
					break;
			}
		}

		private static function applyFormatting(start : int, end : int) : void
		{
			var selection:XML = XML(currentText.substring(start, end));
			trace(selection.toString());
		}
	}
}
