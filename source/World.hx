package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class World extends FlxSprite
{
	private var wasOnScreen:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, ?type:Int=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		if(type !=0)
			makeGraphic(Std.int(FlxG.width - FlxG.width / 3), Std.int(FlxG.height / 3));
		else
			makeGraphic(FlxG.width, Std.int(FlxG.height / 3));
		y -= height;
		FlxG.state.add(this);
		immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (!isOnScreen())
		{
			if (wasOnScreen)
			{
				x = Reg.lastPlatformX;
				Reg.lastPlatformX = Std.int(x + FlxG.width);
				wasOnScreen = false;
			}
		}
		else
		{
			wasOnScreen = true;
		}
	}
	
}