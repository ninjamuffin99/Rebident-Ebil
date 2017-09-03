package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _jill:Jill;
	private var _wall:Wall;
	
	override public function create():Void
	{
		FlxG.camera.antialiasing = true;
		
		_jill = new Jill(90, 44);
		add(_jill);
		
		_wall = new Wall(_jill.x + _jill.width + 4, 0);
		add(_wall);
		
		FlxG.camera.follow(_jill, NO_DEAD_ZONE, 0.5);
		FlxG.camera.maxScrollY = FlxG.height;
		FlxG.camera.targetOffset.x = -35;
		FlxG.camera.deadzone.x = 20;
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.watch.addMouse();
		
		if (FlxG.keys.justPressed.Z)
		{
			hitwall();
		}
		
		super.update(elapsed);
	}
	
	public function hitwall():Void
	{
		_wall.health -= 0.1;
		_wall.alpha -= 0.1;
		if (_wall.health <= 0)
		{
			_newWall();
		}
	}
	
	public function _newWall():Void
	{
		FlxG.log.add("new wall");
		_wall.x += FlxG.width;
		_wall.alpha = 1;
		FlxTween.tween(_jill, {x: _jill.x + FlxG.width});
	}
}