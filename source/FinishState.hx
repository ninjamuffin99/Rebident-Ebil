package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ninjaMuffin
 */
class FinishState extends FlxState 
{
	private var _times:Array<Float>;
	private var _curPart:Int = 0;
	private var _functions:Array<Void->Void>;
	
	
	private var _jill:FlxSprite;
	private var _winText:FlxTypeText;
	private var _bg:FlxSprite;
	
	private var _cameraPan:Bool = false;
	
	private var _creds:FlxText;
	
	override public function create():Void 
	{
		FlxG.fixedTimestep = false;
		
		FlxG.sound.playMusic("assets/music/541084_Corridors-of-Time.mp3");
		FlxG.worldBounds.set(0, 0, FlxG.width, 200);
		FlxG.camera.fade(FlxColor.BLACK, 0.2, true);
		
		_bg = new FlxSprite(0, 0);
		_bg.loadGraphic("assets/images/outro1.png", false, 160, 144);
		add(_bg);
		
		_jill = new FlxSprite(10, 125);
		_jill.loadGraphic("assets/images/jillSpriteWalk.png", true, 16, 16);
		_jill.animation.add("idle", [0], 1, true, true);
		_jill.animation.add("walk", [0, 1], 6);
		add(_jill);
		
		_winText = new FlxTypeText(8, 8, FlxG.width - 16, "Eat shit Chris lol", 8);
		_winText.delay = 0.1;
		add(_winText);
		
		_creds = new FlxText(0, 170, 0 , "REBIDENT EBIL: THE GAME \n\nBased off of 'REBIDENT EBIL' \nby PhantomArcade \nPhantomArcade.newgrounds.com \n\nProgrammed by NinjaMuffin99 \nninjamuffin.newgrounds.com \n\nArt by Moawling \nMoawling.newgrounds.com \n\nSongs: \nJust Kickin' it \nby Father-Of-Death \n\nCorridors of Time \nby dyeo \n\n\n\n\n\n You've unlocked ENDLESS MODE!\nPress E in game to enable it!");
		add(_creds);
		
		
		//These are when the flixel notes/sounds play, you probably shouldn't change these if you want the functions to sync up properly
		_times = [0.041, 4, 7, 8, 40];
		
		//An array of functions to call after each time thing has passed, feel free to rename to whatever
		_functions = [addText1, addText2, addText3, addText4, addText5];
		
		for (time in _times)
		{
			new FlxTimer().start(time, timerCallback);
		}
		
		colorStuff();
		
		Colors._beatGame = true;
		
		//put the included flixel.mp3 into your assests folder in your project
		super.create();
	}
	
	
	private function colorStuff():Void
	{
		if (!Colors._oldColors)
		{
			//White
			_creds.color = Colors.gb0;
			_winText.color = Colors.gb0;
			
			FlxG.camera.bgColor = Colors.gb3;
			
			//Dark Brown
			_bg.replaceColor(0xFF640000, Colors.gb2);
			//BG/Sky
			_bg.replaceColor(0xFF231e21, Colors.gb3);
			_bg.replaceColor(0xFF000000, Colors.gb3);
			//Grass
			_bg.replaceColor(0xFF3e681f, Colors.gb1);
			//Light brown
			_bg.replaceColor(0xFF803700, Colors.gb0);
			
			//Jill
			//Black
			_jill.replaceColor(0xFF231E21, Colors.gb2);
			
			//Blue
			_jill.replaceColor(0xFF0079AD, Colors.gb1);
			
			//Pink
			_jill.replaceColor(0xFFFD8C93, Colors.gb0);
			
		}
		else
		{
			//White
			_creds.color = FlxColor.WHITE;
			_winText.color = FlxColor.WHITE;
			
			FlxG.camera.bgColor = FlxColor.BLACK;
			
			//Dark Brown
			_bg.replaceColor(Colors.gb2, 0xFF640000);
			//BG/Sky
			_bg.replaceColor(Colors.gb3, 0xFF231e21);
			_bg.replaceColor(Colors.gb3, 0xFF000000);
			//Grass
			_bg.replaceColor(Colors.gb1, 0xFF3e681f);
			//Light brown
			_bg.replaceColor(Colors.gb0, 0xFF803700);
			
			//Jill
			//Black
			_jill.replaceColor(Colors.gb2, 0xFF231E21);
			
			//Blue
			_jill.replaceColor(Colors.gb1, 0xFF0079ad);
			
			//Pink
			_jill.replaceColor(Colors.gb0, 0xFFFD8C93 );
			
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		//Thing to skip the splash screen
		//Comment this out if you want it unskippable
		if (FlxG.keys.justPressed.S)
		{
			Colors._oldColors = !Colors._oldColors;
			colorStuff();
			FlxG.camera.flash(FlxColor.WHITE, 0.2);
			FlxG.sound.play("assets/sounds/colorSwap.wav");
		}
		
		if (FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressed)
		{
			finishTween();
		}
		
		if (_cameraPan)
		{
			_bg.y -= 0.2;
			_jill.y -= 0.2;
			_winText.y -= 0.2;
			
			_creds.y -= 0.2;
		}
		
		if (_creds.y <= -200)
		{
			_cameraPan = false;
		}
		
		FlxG.watch.add(_creds, "y");
		
		FlxG.watch.addMouse();
		
		super.update(elapsed);
	}
	
	private function timerCallback(Timer:FlxTimer):Void
	{
		_functions[_curPart]();
		_curPart++;
		
		if (_curPart == 5)
		{
			//What happens when the final sound/timer time passes
			//change parameters to whatever you feel like
			FlxG.camera.fade(FlxColor.BLACK, 3.25, false, finishTween);
			FlxG.sound.music.fadeOut(3.25);
		}
	}
	
	private function addText1():Void
	{
		_jill.velocity.x = 20;
		_jill.animation.play("walk");
	}
	
	private function addText2():Void
	{
		_jill.velocity.x = 0;
		_jill.animation.play("idle");
		
		_winText.start(0.05);
	}
	
	private function addText3():Void
	{
		_jill.velocity.x = 20;
		_jill.animation.play("walk");
		_winText.erase(0.04);
	}
	
	private function addText4():Void
	{
		_cameraPan = true;
	}
	
	private function addText5():Void
	{
		//stuff that happens
	}
	
	private function finishTween():Void
	{
		//Switches to MenuState when the fadeout tween(in the timerCallback function) is finished
		FlxG.switchState(new MenuState());
	}
}