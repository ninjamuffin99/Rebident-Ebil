package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxAxes;

/**
 * ...
 * @author ninjaMuffin
 */
class BootState extends FlxState 
{
	private var _NG:FlxText;
	private var Timer:Float = 0;
	private var _sndPlayed:Bool = false;
	override public function create():Void 
	{
		_NG = new FlxText(0, 0, 0, "Newgrounds", 18);
		_NG.font = "assets/data/Nintender (WIP).ttf";
		_NG.screenCenter(FlxAxes.X);
		_NG.color = Colors.gb3;
		add(_NG);
		
		FlxG.camera.bgColor = Colors.gb0;
		
		FlxTween.tween(_NG, {y: (FlxG.height/2) - 18}, 3);
		
		super.create();
	}
	override public function update(elapsed:Float):Void 
	{
		Timer += FlxG.elapsed;
		
		if (Timer >= 3.1 && !_sndPlayed)
		{
			playSound();
			_sndPlayed = true;
		}
		
		if (Timer >= 5)
		{
			FlxG.switchState(new MenuState());
		}
		
		super.update(elapsed);
	}
	
	private function playSound():Void
	{
		FlxG.sound.play("assets/sounds/bootSOund.mp3");
	}
}