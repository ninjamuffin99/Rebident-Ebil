package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.particles.FlxEmitter;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var _jill:Jill;
	private var _ded:FlxSprite;
	private var _wall:Wall;
	private var _zombie:Zombie;
	
	private var _bustedWalls:Int = 0;
	
	private var _deathTimer:Float = 1.4;
	private var _blood:FlxEmitter;
	private var _justDied:Bool = false;
	
	override public function create():Void
	{
		FlxG.camera.antialiasing = true;
		
		_zombie = new Zombie(20, 44);
		add(_zombie);
		
		
		_jill = new Jill(90, 44);
		add(_jill);
		
		_ded = new FlxSprite(0, 0);
		_ded.loadGraphic("assets/images/zombieBite.png", false, 91, 102);
		add(_ded);
		_ded.visible = false;
		
		_blood = new FlxEmitter(0, 0);
		_blood.makeParticles(3, 3, FlxColor.RED, 50);
		
		add(_blood);
		
		_blood.acceleration.start.min.y = 900;
		_blood.acceleration.start.max.y = 900;
		_blood.acceleration.end.min.y = 900;
		_blood.acceleration.end.max.y = 900;
		_blood.velocity.set( -10, 15, 10, 24);
		
		
		
		_wall = new Wall(_jill.x + _jill.width + 4, 0);
		add(_wall);
		
		FlxG.camera.follow(_jill, NO_DEAD_ZONE, 0.5);
		FlxG.camera.maxScrollY = FlxG.height;
		FlxG.camera.targetOffset.x = -35;
		FlxG.camera.deadzone.x = 20;
		
		FlxG.worldBounds.set(0, 0, FlxG.width * 60, FlxG.height);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.watch.addMouse();
		FlxG.watch.add(_jill, "x");
		if (FlxG.keys.justPressed.Z)
		{
			hitwall();
		}
		
		if (FlxG.overlap(_jill, _zombie))
		{
			_jill.visible = false;
			_zombie.visible = false;
			_ded.visible = true;
			_ded.x = _jill.x - 12;
			_ded.y = _jill.y;
			
			if (!_justDied)
			{
				FlxG.sound.play("assets/sounds/Video Game Pack/GBC scream.wav");
				_blood.setPosition(_jill.x + 28, _jill.y + 37);
				_blood.start(false, 0.02, 50);
				_justDied = true;
			}
			
			
			_deathTimer -= FlxG.elapsed;
			if (_deathTimer <= 0)
			{
				FlxG.switchState(new GameOverState());
			}
		}
		
		super.update(elapsed);
	}
	
	public function hitwall():Void
	{
		_wall.health -= 0.1;
		_wall.alpha -= 0.1;
		if (_wall.health <= 0)
		{
			_bustedWalls += 1;
			FlxG.log.add(_bustedWalls);
			_newWall();
		}
	}
	
	public function _newWall():Void
	{
		FlxG.log.add("new wall");
		_wall.x += FlxG.width;
		_wall.alpha = 1;
		_wall.health = 1 * _bustedWalls;
		FlxTween.tween(_jill, {x: _jill.x + FlxG.width});
	}
}