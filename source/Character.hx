package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Character extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 32);
		x += width * 3;
		velocity.x = Reg.velocityCam;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		velocity.y += Reg.characterAccelY;
		for (i in 0...Reg.worldArray.length)
		{
			if(FlxG.collide(this, Reg.worldArray[i]))
				velocity.y = 0;
		}
		for (i in 0...Reg.object1Array.length)
		{
			if (overlaps(Reg.object1Array[i]))
			{
				Reg.object1Array[i].kill();
				velocity.y = Reg.characterObj1;
			}
		}
		if (y > FlxG.height)
		{
			FlxG.resetState();
		}
	}
}