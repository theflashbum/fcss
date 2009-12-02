package com.flashartofwar.fcss.behaviors
{
	import com.flashartofwar.fcss.styles.IStyle;
	
	import flash.events.IEventDispatcher;

	public interface IApplyStyleBehavior extends IEventDispatcher
	{
		function applyDefaultStyle():void;
		function applyStyle(style:IStyle):void;
		function get className():String;
		function get id():String;
		function get defaultStyleNames():Array;
	}
}