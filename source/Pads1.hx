package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Pads2 extends FlxSprite {
 
	public function new (X,Y) {
		super(X,Y);
		
		makeGraphic(100,10,FlxColor.RED);
		immovable = true; 
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.D && x+width < FlxG.width){
			x += 40;
		}else if(FlxG.keys.justPressed.S && x > 0){
			x -= 40;
		}
	}
} 
