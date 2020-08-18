package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxColorTransformUtil;
import flixel.text.FlxText;
import flixel.math.FlxRandom;
import flixel.system.FlxSound;
//import flixel.util.FlxRandom;
import Pads;
import Pads1;
import Ball;
import Wall;

class PlayState extends FlxState
{
	var ball:Ball;
	var pad1:Pads;
	var wall1:Wall;
	var pad:Pads2;	
	var player1score = 0;
	var player2score = 0;
	var scoretext:FlxText;
	var wintext:FlxText;
	var bg:FlxSprite;
	var ss:FlxSound;
	var maxscore:Int = 5;
	var var1: Int = 1;
	var text:FlxText;
	var text1:FlxText;
	var text2:FlxText;
	var text3:FlxText;
	var text4:FlxText;
	var text5:FlxText;
	var text6:FlxText;


	override public function create():Void
	{
		super.create();
		bg = new FlxSprite();
		bg.makeGraphic(FlxG.width,FlxG.height,FlxColor.WHITE);
		bg.color = FlxColor.BLACK;
		add(bg);
		add(pad1 = new Pads(FlxG.width/2+100,600));
		add(pad = new Pads2(FlxG.width/2-200,600));
		add(wall1 = new Wall(0,50));
		add(ball = new Ball(FlxG.width/2,FlxG.height/2-200));
		scoretext = new FlxText(0,0,FlxG.width,"0|0");
		scoretext.setFormat(null,24,FlxColor.RED,"center");
		add(scoretext);
		wintext = new FlxText(FlxG.width/2-100,FlxG.height/2,"WIN");
		wintext.setFormat(null,24,FlxColor.RED,"center");
		wintext.visible=false;
		add(wintext);
		text = new FlxText(FlxG.width/2-100,FlxG.height/2-50,"WELCOME");
		text.setFormat(null,24,FlxColor.RED,"center");
		text1 = new FlxText(FlxG.width/2-200,FlxG.height/2,"S AND D FOR RED BAR");
		text1.setFormat(null,12,FlxColor.RED,"center");
		text2 = new FlxText(FlxG.width/2-200,FlxG.height/2+50,"L ARROW AND R ARROW  FOR BLUE BAR");
		text2.setFormat(null,12,FlxColor.RED,"center");
		text3 = new FlxText(FlxG.width/2-200,FlxG.height/2+100,"MISS ENEMY GETS POINT");
		text3.setFormat(null,12,FlxColor.RED,"center");
		text4 = new FlxText(FlxG.width/2-200,FlxG.height/2+150,"6 POINTS TO WIN");
		text4.setFormat(null,12,FlxColor.RED,"center");
		text5 = new FlxText(FlxG.width/2-200,FlxG.height/2+200,"PRESS SPACE TO START GOOD LUCK");
		text5.setFormat(null,12,FlxColor.RED,"center");
		text6 = new FlxText(FlxG.width/2-200,FlxG.height/2+250,"BLUE FIRST");
		text6.setFormat(null,12,FlxColor.RED,"center");
		add(text);
		add(text1);
		add(text2);
		add(text3);
		add(text4);
		add(text5);
		add(text6);

		
		



		if (FlxG.sound.music == null){
			FlxG.sound.playMusic(AssetPaths.a__wav, 1, true);

		}


 		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.SPACE)
		{
			remove(text4);
			remove(text1);
			remove(text2);
			remove(text3);
			remove(text5);
			remove(text);
			remove(text6);
			player1score = 0;
			player2score = 0;
			ball.resetball();
			scoretext.text = player1score + "|" + player2score;


		}

		FlxG.collide(ball,wall1,function(ball:FlxSprite,wall1:FlxSprite){
			ball.velocity.x = ball.getMidpoint().x - wall1.getMidpoint().y;
			bg.color = FlxColor.BROWN;
			ss = FlxG.sound.load(AssetPaths.corkpop__wav);
			ss.play();
			FlxG.camera.shake(0.01,0.1);
			if(var1 == 1) {
				var1 = 0;
				//scoretext.text = "0";
			}else{
				var1 = 1;
				//scoretext.text = "1";
			}
			ball.velocity.y ++;

		});
		if(var1 == 1) {

		FlxG.collide(ball,pad1,function(ball:FlxSprite,pad:FlxSprite){
			ball.velocity.x = ball.getMidpoint().x - pad.getMidpoint().y;
			bg.color = FlxColor.YELLOW;
			ss = FlxG.sound.load(AssetPaths.corkpop__wav);
			ss.play();
			FlxG.camera.shake(0.01,0.1);
			ball.velocity.y ++;

			
		});
	}else if (var1 == 0){
		FlxG.collide(ball,pad,function(ball:FlxSprite,pad:FlxSprite){
			ball.velocity.x = ball.getMidpoint().x - pad.getMidpoint().y;
			bg.color =FlxColor.LIME;
			ss = FlxG.sound.load(AssetPaths.corkpop__wav);
			ss.play();
			FlxG.camera.shake(0.01,0.1);
			ball.velocity.y ++;

		});
	}
		if (ball.y + 0  > FlxG.height ){
			if(var1 == 1) {
			player1score++;
			scoretext.text = player1score + "|" + player2score;
			ball.resetball();
		}else{ 
			player2score++;
			scoretext.text = player1score + "|" + player2score;
			ball.resetball();
		}
			if (player2score> maxscore){
				ball.win();
				wintext.text= "PLAYER 1 BLUE WINS";
				wintext.visible = true;
				}
			if (player1score> maxscore){
				ball.win();
				wintext.text= "PLAYER 2 RED WINS";
				wintext.visible = true;
				}
		}
		

		
	}
}
