package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	override public function create():Void
	{
		var bg:FlxSprite;
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/title.png", false, 160, 144);
		add(bg);
		
		FlxG.sound.play("assets/sounds/titleThing.mp3");
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}
		
		super.update(elapsed);
	}
}