package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Precreate extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.objectSize, Reg.objectSize);
		alpha = 0.5;
		FlxG.state.add(this);
		set_visible(false);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (visible)
		{
			x = FlxG.mouse.x - FlxG.mouse.x % Reg.objectSize;
			y = FlxG.mouse.y - FlxG.mouse.y % Reg.objectSize;
		}
	}
	
}