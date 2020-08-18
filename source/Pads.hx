package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Pads extends FlxSprite {

	//var upKey:String;
	//var downKey:String;
 
	public function new (X,Y) {
		super(X,Y);
		//upKey = _upKey;
		//downKey = _downKey;
		
		makeGraphic(100,10,FlxColor.BLUE);

		immovable = true; 
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.RIGHT && x+width < FlxG.width) {
			x += 40;
		}else if(FlxG.keys.justPressed.LEFT &&  x > 0){
			x -= 40;
		}
	}
		
} 