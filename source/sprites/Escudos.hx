package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Escudos extends FlxSprite
{
	private var vidas:Int = 5;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		switch(vidas)
		{
			case 5:
				loadGraphic(AssetPaths.Escudos__png, true, 16, 16);
			case 4:
				loadGraphic(AssetPaths.Escudo4__png, true, 16, 16);
			case 3:
				loadGraphic(AssetPaths.Escudo3__png, true, 16, 16);
			case 2:
				loadGraphic(AssetPaths.Escudo2__png, true, 16, 16);
			case 1:
				loadGraphic(AssetPaths.Escudo1__png, true, 16, 16);
			default:
				destroy();
		}
	}
	public function restarVidas()
	{
		vidas--;
	}
}