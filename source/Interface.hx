package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Interface extends FlxSprite
{
	private var pressed:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(FlxG.width, Std.int(FlxG.height / 10));
		scrollFactor.set(0, 0);
		color = FlxColor.RED;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(this))
		{
			pressed = true;
			Reg.precreate.set_visible(true);
		}
		if (pressed)
		{
			if (FlxG.mouse.justReleased)
			{
				Reg.object1Array.push(new Object1(Reg.precreate.x, Reg.precreate.y));
				Reg.precreate.set_visible(false);
				pressed = false;
			}
		}
	}
}