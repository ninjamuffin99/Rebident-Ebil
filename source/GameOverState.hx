package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ninjaMuffin
 */
class GameOverState extends FlxState 
{
	private var _times:Array<Float>;
	private var _curPart:Int = 0;
	private var _functions:Array<Void->Void>;
	
	private var tempTimer:Float = 0.016;
	
	private var _screen:FlxSprite;
	private var _youDied:FlxSprite;
	private var _IDIOT:FlxText;
	private var _FAGGOT:FlxText;
	
	
	override public function create():Void 
	{
		FlxG.sound.music.pause();
		_screen = new FlxSprite(0, 0);
		_screen.loadGraphic("assets/images/gameover.png", true, 160, 144);
		add(_screen);
		_screen.animation.frameIndex = 0;
		colorSwitch();
		
		/*_youDied = new FlxSprite(200, 0);
		_youDied.makeGraphic(50, 50);
		
		_IDIOT = new FlxText(0, 100, 0, "IDIOT", 20);
		_IDIOT.screenCenter(FlxAxes.X);
		*/
		_FAGGOT = new FlxText(0, 0, 0, "FAGGOT", 20);
		_FAGGOT.color = Colors.gb0;
		_FAGGOT.screenCenter();
		
		
		bgColor = Colors.gb3;
		
		FlxG.fixedTimestep = false;
		
		//These are when the flixel notes/sounds play, you probably shouldn't change these if you want the functions to sync up properly
		_times = [0.054, 1.033, 2.054, 3.242, 4, 4.1];
		
		//An array of functions to call after each time thing has passed, feel free to rename to whatever
		_functions = [addText1, addText2, addText3, addText4, addText5];
		
		for (time in _times)
		{
			new FlxTimer().start(time, timerCallback);
		}
		
		//put the included flixel.mp3 into your assests folder in your project
		FlxG.sound.play("assets/sounds/gameOver.mp3", 1, false, null, true);
		super.create();
	}
	
	private function colorSwitch():Void
	{
		//Black
		_screen.replaceColor(0xFF000000, 0xFF0F380F);
		
		//Dark Red
		_screen.replaceColor(0xFFAA0500, 0xFF306230);
		
		//Light red
		_screen.replaceColor(0xFFFF0800, 0xFF9BBC0F);
		
		//Blue
		_screen.replaceColor(0xFF0078ad, 0xFF306230);
		
		//Pink
		_screen.replaceColor(0xFFfd8c93, 0xFF9bbc0f);
		
		//White
		_screen.replaceColor(0xFFFFFFFF, 0xFF9bbc0f);
	}
	
	override public function update(elapsed:Float):Void 
	{
		//Thing to skip the splash screen
		//Comment this out if you want it unskippable
		if (FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressed)
		{
			finishTween();
		}
		
		
		
		tempTimer -= FlxG.elapsed;
		if (tempTimer <= 0)
		{
			_FAGGOT.visible = !_FAGGOT.visible;
			tempTimer = 0.035;
		}
		
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
			FlxG.camera.fade(Colors.gb3, 0.4, false, finishTween);
		}
	}
	
	private function addText1():Void
	{
		//stuff that happens
	}
	
	private function addText2():Void
	{
		_screen.animation.frameIndex = 1;
	}
	
	private function addText3():Void
	{
		_screen.animation.frameIndex = 2;
	}
	
	private function addText4():Void
	{
		add(_FAGGOT);
		
		_screen.visible = false;
		//_youDied.visible = false;
		//_IDIOT.visible = false;
		
	}
	
	private function addText5():Void
	{
		
		FlxG.switchState(new MenuState());
		
	}
	
	private function finishTween():Void
	{
		//Switches to MenuState when the fadeout tween(in the timerCallback function) is finished
		FlxG.switchState(new MenuState());
	}
	
}