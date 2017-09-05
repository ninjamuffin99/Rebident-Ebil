#if !macro


@:access(lime.app.Application)
@:access(lime.Assets)
@:access(openfl.display.Stage)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		var display = new CustomPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		app.setPreloader (preloader);
		preloader.onComplete.add (init);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/gameover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/jill.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/jillidle.aseprite");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/jillidle.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/jillwall.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/MedalIcons/jillSad.PNG");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/title.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/zombie.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/zombieBite.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/music/Resident Evil GBC Music full.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/music/Resident Evil GBC Music full.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/gameOver.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/jillBounce.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/titleThing.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Video Game Pack/8 bit blood.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/8 bit bump.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/8 bit laser.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/8 bit machine gun.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/8bit Explosion Sound Effects Retro Games Soundholder.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/game fuzz.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/GAME OVER.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/GBC pain.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/GBC scream.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/konami pause.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/Resident Evil GBC Music cut.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Video Game Pack/Zombie moan.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/video-game-pack.zip");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/sounds/walk.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("flixel/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("flixel/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Monsterrat");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("flixel/images/ui/button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/images/logo/default.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		
		if (total == 0) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "272",
			company: "ninjaMuffin",
			file: "RebidentEbil",
			fps: 60,
			name: "Rebident Ebil",
			orientation: "",
			packageName: "com.example.myapp",
			version: "0.0.1",
			windows: [
				
				{
					antialiasing: 0,
					background: 0,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: false,
					hardware: true,
					height: 480,
					parameters: "{}",
					resizable: true,
					stencilBuffer: true,
					title: "Rebident Ebil",
					vsync: true,
					width: 640,
					x: null,
					y: null
				},
			]
			
		};
		
		#if hxtelemetry
		var telemetry = new hxtelemetry.HxTelemetry.Config ();
		telemetry.allocations = true;
		telemetry.host = "localhost";
		telemetry.app_name = config.name;
		Reflect.setField (config, "telemetry", telemetry);
		#end
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 640, 480, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		#if !flash
		if (openfl.Lib.current.stage.window.fullscreen) {
			
			openfl.Lib.current.stage.dispatchEvent (new openfl.events.FullScreenEvent (openfl.events.FullScreenEvent.FULL_SCREEN, false, false, true, true));
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		#end
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
