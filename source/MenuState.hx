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
		
		///Black
		bg.replaceColor(0xFF000000, Colors.gb3);
		
		///Grey
		bg.replaceColor(0xFF898b90, Colors.gb2);
		bg.replaceColor(0xFF888888, Colors.gb2);
		
		//REd
		bg.replaceColor(0xFFff0800, Colors.gb0);
		//AA red
		bg.replaceColor(0xFFaa0500, Colors.gb1);
		bg.replaceColor(0xFFb35d5c, Colors.gb1);
		
		
		FlxG.sound.play("assets/sounds/titleBit.wav", 1, false, null, true, playSong);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.Z || FlxG.keys.justPressed.X)
		{
			FlxG.switchState(new PlayState());
		}
		
		super.update(elapsed);
	}
	
	private function playSong():Void
	{
		FlxG.sound.playMusic("assets/music/titleScreen.mp3");
		
	}
}