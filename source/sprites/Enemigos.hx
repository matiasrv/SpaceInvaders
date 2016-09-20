package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Enemigos extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		velocity.x = 10;
	}	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (x > FlxG.width - width && velocity.x > 0)
			Reg.reboteEnemigos = true;
		if (x < 0 && velocity.x < 0)
			Reg.reboteEnemigos = true;
		if (Reg.reboteEnemigos == true)
		{
			velocity.x *= -1;
			y += 2;
			Reg.conE++;
			if (Reg.conE == Reg.enemigosAlive)
			{
				Reg.reboteEnemigos = false;
				Reg.conE = 0;
			}
		}
	}
}	

