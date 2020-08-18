package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Wall extends FlxSprite {

	//var upKey:String;
	//var downKey:String;
 
	public function new (X,Y) {
		super(X,Y);
		//upKey = _upKey;
		//downKey = _downKey;
		
		makeGraphic(1000,10,FlxColor.RED);

		immovable = true; 
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}