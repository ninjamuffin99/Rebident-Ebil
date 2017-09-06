package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	private var bg:FlxSprite;
	override public function create():Void
	{
		
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/title.png", false, 160, 144);
		add(bg);
		
		colorSwitch();
		
		FlxG.sound.play("assets/sounds/titleBit.wav", 1, false, null, true, playSong);
		
		super.create();
	}
	
	
	private function colorSwitch():Void
	{
		if (!Colors._oldColors)
		{
			bg.replaceColor(0xFF000000, Colors.gb3);
			
			///Grey
			bg.replaceColor(0xFF898b90, Colors.gb2);
			bg.replaceColor(0xFF888888, Colors.gb2);
			
			//REd
			bg.replaceColor(0xFFff0800, Colors.gb0);
			//AA red
			bg.replaceColor(0xFFaa0500, Colors.gb1);
			bg.replaceColor(0xFFb35d5c, Colors.gb1);
		}
		else
		{
			bg.replaceColor(Colors.gb3, 0xFF000000);
			
			///Grey
			bg.replaceColor(Colors.gb2, 0xFF898b90);
			bg.replaceColor(Colors.gb2, 0xFF888888);
			
			//REd
			bg.replaceColor(Colors.gb0, 0xFFff0800);
			//AA red
			bg.replaceColor(Colors.gb1, 0xFFaa0500);
			bg.replaceColor(Colors.gb1, 0xFFb35d5c );
		}
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.Z || FlxG.keys.justPressed.X)
		{
			FlxG.switchState(new PlayState());
		}
		
		if (FlxG.keys.justPressed.S)
		{
			Colors._oldColors = !Colors._oldColors;
			FlxG.camera.flash(FlxColor.WHITE, 0.2);
			FlxG.sound.play("assets/sounds/colorSwap.wav");
			colorSwitch();
		}
		
		super.update(elapsed);
	}
	
	private function playSong():Void
	{
		FlxG.sound.playMusic("assets/music/titleScreen.mp3");
		
	}
}