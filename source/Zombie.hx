package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ninjaMuffin
 */
class Zombie extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/images/zombie.png", true, 88, 105);
		animation.add("walk", [0, 1], 2);
		animation.play("walk");
		acceleration.x = 4;
		maxVelocity.x = 50;
		FlxTween.tween(this, {y: this.y + 5}, 0.025, {type:FlxTween.PINGPONG, loopDelay: 0.4});
		
		
		//Black
		replaceColor(0xFF231e21, Colors.gb2);
		
		//Darkl Green
		replaceColor(0xFF15aa00, Colors.gb1);
		//pretty much same shade of dark green
		replaceColor(0xFF14aa00, Colors.gb1);
		
		//Light green
		replaceColor(0xFFb1d284, Colors.gb0);
		
		width = 30;
		
	}
	override public function update(elapsed:Float):Void 
	{
		FlxG.watch.add(this.velocity, "x");
		
		super.update(elapsed);
	}
	
}