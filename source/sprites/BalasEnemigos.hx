package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Balasenemigo extends FlxSprite
{
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(3, 4);
		color = 0xFF2120;
		velocity.y = 50;
	}
		override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (y > FlxG.height) 
		{
			destroy();
		}	
	}
}