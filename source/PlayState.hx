package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.particles.FlxEmitter;
import flixel.math.FlxRect;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

import com.newgrounds.*;

class PlayState extends FlxState
{
	private var _bg:FlxSprite;
	private var _fg:FlxSprite;
	
	private var _jill:Jill;
	private var _ded:FlxSprite;
	private var _wall:Wall;
	private var _zombie:Zombie;
	
	private var _bustedWalls:Int = 0;
	
	private var _deathTimer:Float = 1.4;
	private var _blood:FlxEmitter;
	private var _justDied:Bool = false;
	
	private var _endlessMode:Bool = false;
	private var _finishGameWidth:Float;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.sound.playMusic("assets/music/Resident Evil GBC Music full.mp3");
		FlxG.sound.music.play();
		
		
		_bg = new FlxSprite(0 - 160, 0);
		_bg.loadGraphic("assets/images/bg.png", false, 320, 144);
		add(_bg);
		
		
		
		_zombie = new Zombie(-30, 44);
		add(_zombie);
		
		
		_wall = new Wall(126, 0);
		add(_wall);
		
		_jill = new Jill(70, 44);
		add(_jill);
		
		_ded = new FlxSprite(0, 0);
		_ded.loadGraphic("assets/images/zombieBite.png", true, 91, 102);
		_ded.animation.add("ded", [0, 0, 1], 3, false);
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
		
		
		_fg = new FlxSprite((_wall.x + _wall.width) - FlxG.width * 2, 0);
		_fg.loadGraphic("assets/images/fgWall.png", false, 334, 144);
		add(_fg);
		
		
		bgColors();
		
		FlxG.camera.follow(_jill, NO_DEAD_ZONE, 0.5);
		FlxG.camera.maxScrollY = FlxG.height;
		FlxG.camera.targetOffset.x = -35;
		FlxG.camera.deadzone.x = 20;
		
		_finishGameWidth = FlxG.width * 2;
		
		
		//FlxG.game.setFilters(Colors.gbFilter);
		
	}
	
	private function bgColors():Void
	{
		if (!Colors._oldColors)
		{
			//ZOmbie
			//Black
			_zombie.replaceColor(0xFF231e21, Colors.gb2);
			
			//Darkl Green
			_zombie.replaceColor(0xFF15aa00, Colors.gb1);
			
			//pretty much same shade of dark green
			_zombie.replaceColor(0xFF14aa00, Colors.gb1);
			
			//Light green
			_zombie.replaceColor(0xFFb1d284, Colors.gb0);
			
			
			//Black
			_bg.replaceColor(0xFF000000, Colors.gb3);
			_wall.replaceColor(0xFF000000, Colors.gb3);
			_fg.replaceColor(0xFF000000, Colors.gb3);
			
			//dark brown
			_bg.replaceColor(0xFF640000, Colors.gb2);
			_wall.replaceColor(0xFF640000, Colors.gb2);
			_fg.replaceColor(0xFF640000, Colors.gb2);
			
			//brown
			_bg.replaceColor(0xFF803600, Colors.gb1);
			_bg.replaceColor(0xFF803700, Colors.gb1);
			_bg.replaceColor(0xFF775100, Colors.gb1);
			
			_wall.replaceColor(0xFF803600, Colors.gb1);
			_wall.replaceColor(0xFF803700, Colors.gb1);
			_wall.replaceColor(0xFF775100, Colors.gb1);
			
			_fg.replaceColor(0xFF803600, Colors.gb1);
			_fg.replaceColor(0xFF803700, Colors.gb1);
			_fg.replaceColor(0xFF775100, Colors.gb1);
			
			//light brown
			_bg.replaceColor(0xFF805e58, Colors.gb0);
			_wall.replaceColor(0xFF805e58, Colors.gb0);
			_fg.replaceColor(0xFF805e58, Colors.gb0);
			
			//Jills colors
			_ded.replaceColor(0xFF231E21, FlxColor.fromString("#306230"));
			_ded.replaceColor(0xFF0078AD, FlxColor.fromString("#8bac0f"));
			_ded.replaceColor(0xFF0079AD, FlxColor.fromString("#8bac0f"));
			_ded.replaceColor(0xFFFD8C93, FlxColor.fromString("#9bbc0f"));
			//Zombie Colors
			_ded.replaceColor(0xFF231e21, Colors.gb2);
			_ded.replaceColor(0xFF15aa00, Colors.gb1);
			_ded.replaceColor(0xFF14aa00, Colors.gb1);
			_ded.replaceColor(0xFFb1d284, Colors.gb0);
			
			FlxG.camera.bgColor = Colors.gb3;
		}
		
		else
		{
			//ZOmbie
			//Black
			_zombie.replaceColor(Colors.gb2, 0xFF231e21);
			
			//Darkl Green
			_zombie.replaceColor(Colors.gb1, 0xFF15aa00);
			
			//pretty much same shade of dark green
			_zombie.replaceColor(Colors.gb1, 0xFF14aa00);
			
			//Light green
			_zombie.replaceColor(Colors.gb0, 0xFFb1d284);
			
			//Black
			_bg.replaceColor(Colors.gb3, 0xFF000000);
			_wall.replaceColor( Colors.gb3, 0xFF000000);
			_fg.replaceColor(Colors.gb3, 0xFF000000);
			
			//dark brown
			_bg.replaceColor(Colors.gb2, 0xFF640000);
			_wall.replaceColor(Colors.gb2, 0xFF640000);
			_fg.replaceColor(Colors.gb2, 0xFF640000);
			
			//brown
			_bg.replaceColor(Colors.gb1, 0xFF803600);
			_bg.replaceColor(Colors.gb1, 0xFF803700);
			_bg.replaceColor(Colors.gb1, 0xFF775100);
			
			_wall.replaceColor(Colors.gb1, 0xFF803600);
			_wall.replaceColor(Colors.gb1, 0xFF803700);
			_wall.replaceColor(Colors.gb1, 0xFF775100);
			
			_fg.replaceColor(Colors.gb1, 0xFF803600);
			_fg.replaceColor(Colors.gb1, 0xFF803700);
			_fg.replaceColor(Colors.gb1, 0xFF775100);
			
			//light brown
			_bg.replaceColor(Colors.gb0, 0xFF805e58);
			_wall.replaceColor(Colors.gb0, 0xFF805e58);
			_fg.replaceColor(Colors.gb0, 0xFF805e58);
			
			//Jills colors
			_ded.replaceColor(Colors.gb2, 0xFF231E21);
			_ded.replaceColor(Colors.gb1, 0xFF0078AD);
			_ded.replaceColor(Colors.gb1, 0xFF0079AD);
			_ded.replaceColor(Colors.gb0, 0xFFFD8C93);
			//Zombie Colors
			_ded.replaceColor(Colors.gb2, 0xFF231e21);
			_ded.replaceColor(Colors.gb1, 0xFF15aa00);
			_ded.replaceColor(Colors.gb1, 0xFF14aa00);
			_ded.replaceColor(Colors.gb0, 0xFFb1d284);
			
			FlxG.camera.bgColor = FlxColor.BLACK;
		}
	}

	override public function update(elapsed:Float):Void
	{
		
		FlxG.worldBounds.set(0, -10, 160 * 60, FlxG.height + 20);
		FlxG.watch.addMouse();
		FlxG.watch.add(_jill, "x");
		
		FlxG.collide(_jill, _wall);
		
		if (FlxG.keys.justPressed.Z && !_justDied && _jill.x >= _wall.x - _jill.width - 10)
		{
			hitwall();
		}
		
		if (FlxG.keys.justPressed.E && !_endlessMode && Colors._beatGame)
		{
			_endlessMode = !_endlessMode;
			FlxG.sound.play("assets/sounds/Video Game Pack/konami pause.wav");
		}
		
		if (API.username == "PhantomArcade")
		{
			if (FlxG.keys.justPressed.D)
			{
				FlxG.switchState(new FinishState());
			}
		}
		
		if (FlxG.keys.justPressed.S)
		{
			Colors._oldColors = !Colors._oldColors;
			FlxG.camera.flash(FlxColor.WHITE, 0.2);
			FlxG.sound.play("assets/sounds/colorSwap.wav");
			bgColors();
		}
		
		if (_zombie.x >= _jill.x - 30)
		{
			_jill.visible = false;
			_zombie.visible = false;
			_ded.visible = true;
			_zombie.x += 200;
			_ded.x = _jill.x - 12;
			_ded.y = _jill.y;
			
			if (!_justDied)
			{
				_ded.animation.play("ded");
				if (_bustedWalls < 1)
				{
					API.unlockMedal("Wow Jill, you suck at this game!");
				}
				
				FlxG.sound.play("assets/sounds/Video Game Pack/GBC scream.wav");
				_blood.setPosition(_jill.x + 28, _jill.y + 37);
				_blood.start(false, 0.02, 50);
				_justDied = true;
				
				if (_endlessMode)
					API.postScore("ENDLESS MODE: Walls Busted", _bustedWalls);
			}
			
			
			_deathTimer -= FlxG.elapsed;
			if (_deathTimer <= 0)
			{
				FlxG.switchState(new GameOverState());
			}
		}
		
		if (_jill.x >= FlxG.width * 15 && !_endlessMode)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.2, false, function(){FlxG.switchState(new FinishState()); });
		}
		
		super.update(elapsed);
	}
	
	public function hitwall():Void
	{
		_wall.health -= 0.1;
		FlxG.sound.play("assets/sounds/smackLow.wav");
		
		if (_bustedWalls > 0)
		{
			_wall.alpha -= 0.1 / (1 * (_bustedWalls/5));
		}
		else
			_wall.alpha -= 0.2;
		
		if (_wall.health <= 0.5)
		{
			_bustedWalls += 1;
			FlxG.sound.play("assets/sounds/wall.wav");
			FlxG.log.add(_bustedWalls);
			_newWall();
		}
	}
	
	public function _newWall():Void
	{
		FlxG.log.add("new wall");
		
		
		_wall.health = 1 * (_bustedWalls/5);
		_wall.x += FlxG.width;
		_bg.x += FlxG.width;
		_fg.x += FlxG.width;
		_wall.alpha = 1;
		
		if (_endlessMode)
		{
			if (_wall.health >= 2.2)
			{
				_wall.health = 2;
			}
		}
		
		FlxG.log.add(_wall.health + "no underscore");
		FlxG.log.add(_wall._health + "underscpre");
		//FlxTween.tween(_jill, {x: _jill.x + FlxG.width}, 1);
		_wall.updateHitbox();
	}
	
}