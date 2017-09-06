package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class Jill extends FlxSprite 
{
	var _up:Bool = true;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/images/jill.png", true, 51, 100);
		animation.add("idle", [0]);
		animation.add("wall", [1, 2], 6, false);
		animation.play("idle");
		drag.x = 50;
		
		colorStuff();
	}
	override public function update(elapsed:Float):Void 
	{
		
		if (FlxG.keys.justPressed.A)
		{
			FlxG.camera.antialiasing = !FlxG.camera.antialiasing;
		}
		
		
		if (FlxG.keys.justPressed.X && !FlxG.keys.pressed.Z)
		{
			velocity.x += 30;
			FlxG.sound.play("assets/sounds/walk.wav");
			if (_up)
				y += 8;
			else
				y -= 8;
			_up = !_up;
		}
		
		FlxG.watch.add(this.velocity, "x");
		
		if (FlxG.keys.justPressed.Z)
		{
			FlxG.camera.shake(0.01, 0.1);
			FlxG.sound.play("assets/sounds/jillBounce.mp3");
			animation.play("wall");
			
			x += 15;
		}
		if (FlxG.keys.justReleased.Z)
		{
			x -= 15;
		}
		if (!FlxG.keys.pressed.Z)
		{
			animation.play("idle");
			
		}
		super.update(elapsed);
	}
	
	private function colorStuff():Void
	{
		
		//Black
		replaceColor(0xFF231E21, FlxColor.fromString("#306230"));
		
		//Blue
		replaceColor(0xFF0078AD, FlxColor.fromString("#8bac0f"), false);
		
		//Pink
		replaceColor(0xFFFD8C93, FlxColor.fromString("#9bbc0f"));
	}
	
}