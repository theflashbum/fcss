package com.flashartofwar.fcss.styles 
{

	/**
	 * @author jessefreeman
	 */
	public interface IStyle 
	{
		function set styleName(value:String):void;
		function get styleName():String;
		function merge(object:Object):void;
		function toString():String;
		function clone():IStyle;
	}
}
