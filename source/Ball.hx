package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxTimer;

class Ball extends FlxSprite {
	public function new(X,Y) {
		super(X,Y);

		makeGraphic(10,10,FlxColor.WHITE);

		velocity.y = 150;

		elasticity = 1;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(x < 0){
			velocity.x *= -1;
		}
		if(x+width > FlxG.width){
			velocity.x *= -1;
		}
	}
	 public function resetball() {
			x = FlxG.width/2;

			y = FlxG.height/2-250;

			velocity.y = 150;
			velocity.x = 0;
			

	}
	public function win() {
		 velocity.set();
		
	}

}