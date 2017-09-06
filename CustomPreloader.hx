package;

import flixel.system.FlxBasePreloader;
import com.newgrounds.*;
import com.newgrounds.components.*;

/**
 * ...
 * @author ninjaMuffin
 */
class CustomPreloader extends FlxBasePreloader 
{

	public function new(MinDisplayTime:Float=0, ?AllowedURLs:Array<String>) 
	{
		super(MinDisplayTime, AllowedURLs);
		
	}
	
	override function create():Void 
	{
		API.connect(root, "API ID", "ENC KEY");
		
		if (API.isNewgrounds)
		{
			var ad:FlashAd = new FlashAd();
			ad.x = 30;
			ad.y = 20;
			addChild(ad);
			minDisplayTime = 8;
		}
		
		super.create();
	}
	
}