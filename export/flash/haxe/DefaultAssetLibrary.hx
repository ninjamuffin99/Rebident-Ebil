package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/images/gameover.png", __ASSET__assets_images_gameover_png);
		type.set ("assets/images/gameover.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/jill.png", __ASSET__assets_images_jill_png);
		type.set ("assets/images/jill.png", AssetType.IMAGE);
		className.set ("assets/images/jillidle.aseprite", __ASSET__assets_images_jillidle_aseprite);
		type.set ("assets/images/jillidle.aseprite", AssetType.BINARY);
		className.set ("assets/images/jillidle.png", __ASSET__assets_images_jillidle_png);
		type.set ("assets/images/jillidle.png", AssetType.IMAGE);
		className.set ("assets/images/jillwall.png", __ASSET__assets_images_jillwall_png);
		type.set ("assets/images/jillwall.png", AssetType.IMAGE);
		className.set ("assets/images/MedalIcons/jillSad.PNG", __ASSET__assets_images_medalicons_jillsad_png);
		type.set ("assets/images/MedalIcons/jillSad.PNG", AssetType.IMAGE);
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		className.set ("assets/images/zombie.png", __ASSET__assets_images_zombie_png);
		type.set ("assets/images/zombie.png", AssetType.IMAGE);
		className.set ("assets/images/zombieBite.png", __ASSET__assets_images_zombiebite_png);
		type.set ("assets/images/zombieBite.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/music/Resident Evil GBC Music full.wav", __ASSET__assets_music_resident_evil_gbc_music_full_wav);
		type.set ("assets/music/Resident Evil GBC Music full.wav", AssetType.SOUND);
		className.set ("assets/sounds/gameOver.mp3", __ASSET__assets_sounds_gameover_mp3);
		type.set ("assets/sounds/gameOver.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/jillBounce.mp3", __ASSET__assets_sounds_jillbounce_mp3);
		type.set ("assets/sounds/jillBounce.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/Video Game Pack/8 bit blood.wav", __ASSET__assets_sounds_video_game_pack_8_bit_blood_wav);
		type.set ("assets/sounds/Video Game Pack/8 bit blood.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/8 bit bump.wav", __ASSET__assets_sounds_video_game_pack_8_bit_bump_wav);
		type.set ("assets/sounds/Video Game Pack/8 bit bump.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/8 bit laser.wav", __ASSET__assets_sounds_video_game_pack_8_bit_laser_wav);
		type.set ("assets/sounds/Video Game Pack/8 bit laser.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/8 bit machine gun.wav", __ASSET__assets_sounds_video_game_pack_8_bit_machine_gun_wav);
		type.set ("assets/sounds/Video Game Pack/8 bit machine gun.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/8bit Explosion Sound Effects Retro Games Soundholder.wav", __ASSET__assets_sounds_video_game_pack_8bit_explosion_sound_effects_retro_games_soundholder_wav);
		type.set ("assets/sounds/Video Game Pack/8bit Explosion Sound Effects Retro Games Soundholder.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/game fuzz.wav", __ASSET__assets_sounds_video_game_pack_game_fuzz_wav);
		type.set ("assets/sounds/Video Game Pack/game fuzz.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/GAME OVER.wav", __ASSET__assets_sounds_video_game_pack_game_over_wav);
		type.set ("assets/sounds/Video Game Pack/GAME OVER.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/GBC pain.wav", __ASSET__assets_sounds_video_game_pack_gbc_pain_wav);
		type.set ("assets/sounds/Video Game Pack/GBC pain.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/GBC scream.wav", __ASSET__assets_sounds_video_game_pack_gbc_scream_wav);
		type.set ("assets/sounds/Video Game Pack/GBC scream.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/konami pause.wav", __ASSET__assets_sounds_video_game_pack_konami_pause_wav);
		type.set ("assets/sounds/Video Game Pack/konami pause.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/Resident Evil GBC Music cut.wav", __ASSET__assets_sounds_video_game_pack_resident_evil_gbc_music_cut_wav);
		type.set ("assets/sounds/Video Game Pack/Resident Evil GBC Music cut.wav", AssetType.SOUND);
		className.set ("assets/sounds/Video Game Pack/Zombie moan.wav", __ASSET__assets_sounds_video_game_pack_zombie_moan_wav);
		type.set ("assets/sounds/Video Game Pack/Zombie moan.wav", AssetType.SOUND);
		className.set ("assets/sounds/video-game-pack.zip", __ASSET__assets_sounds_video_game_pack_zip);
		type.set ("assets/sounds/video-game-pack.zip", AssetType.BINARY);
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/gameover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/jill.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/jillidle.aseprite";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/jillidle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/jillwall.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/MedalIcons/jillSad.PNG";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/zombie.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/zombieBite.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/Resident Evil GBC Music full.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/gameOver.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/jillBounce.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Video Game Pack/8 bit blood.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/8 bit bump.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/8 bit laser.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/8 bit machine gun.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/8bit Explosion Sound Effects Retro Games Soundholder.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/game fuzz.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/GAME OVER.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/GBC pain.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/GBC scream.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/konami pause.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/Resident Evil GBC Music cut.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Video Game Pack/Zombie moan.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/video-game-pack.zip";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "flixel/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/gameover.png", __ASSET__assets_images_gameover_png);
		type.set ("assets/images/gameover.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/jill.png", __ASSET__assets_images_jill_png);
		type.set ("assets/images/jill.png", AssetType.IMAGE);
		
		className.set ("assets/images/jillidle.aseprite", __ASSET__assets_images_jillidle_aseprite);
		type.set ("assets/images/jillidle.aseprite", AssetType.BINARY);
		
		className.set ("assets/images/jillidle.png", __ASSET__assets_images_jillidle_png);
		type.set ("assets/images/jillidle.png", AssetType.IMAGE);
		
		className.set ("assets/images/jillwall.png", __ASSET__assets_images_jillwall_png);
		type.set ("assets/images/jillwall.png", AssetType.IMAGE);
		
		className.set ("assets/images/MedalIcons/jillSad.PNG", __ASSET__assets_images_medalicons_jillsad_png);
		type.set ("assets/images/MedalIcons/jillSad.PNG", AssetType.IMAGE);
		
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		
		className.set ("assets/images/zombie.png", __ASSET__assets_images_zombie_png);
		type.set ("assets/images/zombie.png", AssetType.IMAGE);
		
		className.set ("assets/images/zombieBite.png", __ASSET__assets_images_zombiebite_png);
		type.set ("assets/images/zombieBite.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/music/Resident Evil GBC Music full.wav", __ASSET__assets_music_resident_evil_gbc_music_full_wav);
		type.set ("assets/music/Resident Evil GBC Music full.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/gameOver.mp3", __ASSET__assets_sounds_gameover_mp3);
		type.set ("assets/sounds/gameOver.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/jillBounce.mp3", __ASSET__assets_sounds_jillbounce_mp3);
		type.set ("assets/sounds/jillBounce.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/Video Game Pack/8 bit blood.wav", __ASSET__assets_sounds_video_game_pack_8_bit_blood_wav);
		type.set ("assets/sounds/Video Game Pack/8 bit blood.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/8 bit bump.wav", __ASSET__assets_sounds_video_game_pack_8_bit_bump_wav);
		type.set ("assets/sounds/Video Game Pack/8 bit bump.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/8 bit laser.wav", __ASSET__assets_sounds_video_game_pack_8_bit_laser_wav);
		type.set ("assets/sounds/Video Game Pack/8 bit laser.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/8 bit machine gun.wav", __ASSET__assets_sounds_video_game_pack_8_bit_machine_gun_wav);
		type.set ("assets/sounds/Video Game Pack/8 bit machine gun.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/8bit Explosion Sound Effects Retro Games Soundholder.wav", __ASSET__assets_sounds_video_game_pack_8bit_explosion_sound_effects_retro_games_soundholder_wav);
		type.set ("assets/sounds/Video Game Pack/8bit Explosion Sound Effects Retro Games Soundholder.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/game fuzz.wav", __ASSET__assets_sounds_video_game_pack_game_fuzz_wav);
		type.set ("assets/sounds/Video Game Pack/game fuzz.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/GAME OVER.wav", __ASSET__assets_sounds_video_game_pack_game_over_wav);
		type.set ("assets/sounds/Video Game Pack/GAME OVER.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/GBC pain.wav", __ASSET__assets_sounds_video_game_pack_gbc_pain_wav);
		type.set ("assets/sounds/Video Game Pack/GBC pain.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/GBC scream.wav", __ASSET__assets_sounds_video_game_pack_gbc_scream_wav);
		type.set ("assets/sounds/Video Game Pack/GBC scream.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/konami pause.wav", __ASSET__assets_sounds_video_game_pack_konami_pause_wav);
		type.set ("assets/sounds/Video Game Pack/konami pause.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/Resident Evil GBC Music cut.wav", __ASSET__assets_sounds_video_game_pack_resident_evil_gbc_music_cut_wav);
		type.set ("assets/sounds/Video Game Pack/Resident Evil GBC Music cut.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Video Game Pack/Zombie moan.wav", __ASSET__assets_sounds_video_game_pack_zombie_moan_wav);
		type.set ("assets/sounds/Video Game Pack/Zombie moan.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/video-game-pack.zip", __ASSET__assets_sounds_video_game_pack_zip);
		type.set ("assets/sounds/video-game-pack.zip", AssetType.BINARY);
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_jill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_jillidle_aseprite extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_jillidle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_jillwall_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_medalicons_jillsad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_zombie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_zombiebite_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_resident_evil_gbc_music_full_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_gameover_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jillbounce_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_8_bit_blood_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_8_bit_bump_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_8_bit_laser_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_8_bit_machine_gun_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_8bit_explosion_sound_effects_retro_games_soundholder_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_game_fuzz_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_game_over_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_gbc_pain_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_gbc_scream_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_konami_pause_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_resident_evil_gbc_music_cut_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_zombie_moan_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_video_game_pack_zip extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5
































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:image("assets/images/gameover.png") #if display private #end class __ASSET__assets_images_gameover_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/jill.png") #if display private #end class __ASSET__assets_images_jill_png extends lime.graphics.Image {}
@:file("assets/images/jillidle.aseprite") #if display private #end class __ASSET__assets_images_jillidle_aseprite extends lime.utils.Bytes {}
@:image("assets/images/jillidle.png") #if display private #end class __ASSET__assets_images_jillidle_png extends lime.graphics.Image {}
@:image("assets/images/jillwall.png") #if display private #end class __ASSET__assets_images_jillwall_png extends lime.graphics.Image {}
@:image("assets/images/MedalIcons/jillSad.PNG") #if display private #end class __ASSET__assets_images_medalicons_jillsad_png extends lime.graphics.Image {}
@:image("assets/images/title.png") #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:image("assets/images/zombie.png") #if display private #end class __ASSET__assets_images_zombie_png extends lime.graphics.Image {}
@:image("assets/images/zombieBite.png") #if display private #end class __ASSET__assets_images_zombiebite_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/music/Resident Evil GBC Music full.wav") #if display private #end class __ASSET__assets_music_resident_evil_gbc_music_full_wav extends lime.utils.Bytes {}
@:file("assets/sounds/gameOver.mp3") #if display private #end class __ASSET__assets_sounds_gameover_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/jillBounce.mp3") #if display private #end class __ASSET__assets_sounds_jillbounce_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/8 bit blood.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_8_bit_blood_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/8 bit bump.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_8_bit_bump_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/8 bit laser.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_8_bit_laser_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/8 bit machine gun.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_8_bit_machine_gun_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/8bit Explosion Sound Effects Retro Games Soundholder.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_8bit_explosion_sound_effects_retro_games_soundholder_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/game fuzz.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_game_fuzz_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/GAME OVER.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_game_over_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/GBC pain.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_gbc_pain_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/GBC scream.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_gbc_scream_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/konami pause.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_konami_pause_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/Resident Evil GBC Music cut.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_resident_evil_gbc_music_cut_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Video Game Pack/Zombie moan.wav") #if display private #end class __ASSET__assets_sounds_video_game_pack_zombie_moan_wav extends lime.utils.Bytes {}
@:file("assets/sounds/video-game-pack.zip") #if display private #end class __ASSET__assets_sounds_video_game_pack_zip extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end