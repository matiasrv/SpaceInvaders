package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{  private var cuadrado:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		Reg.highscore = 100;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
