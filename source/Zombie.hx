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
	//The zombie class with simple logic!
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/images/zombie.png", true, 88, 105);
		animation.add("walk", [0, 1], 2);
		animation.play("walk");
		acceleration.x = 4;
		maxVelocity.x = 60;
		FlxTween.tween(this, {y: this.y + 5}, 0.025, {type:FlxTween.PINGPONG, loopDelay: 0.4});
		
		width = 30;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.watch.add(this.velocity, "x");
		
		super.update(elapsed);
	}
	
}