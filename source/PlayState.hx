package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.FlxObject;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		FlxG.worldBounds.set(0, 0, 1000000, FlxG.height);
		var cammov = new FlxObject(FlxG.width/2, 0);
		cammov.velocity.x = Reg.velocityCam;
		add(cammov);
		FlxG.camera.follow(cammov);
		FlxG.camera.setScrollBounds(0, null, 0, FlxG.width);
		Reg.character = new Character(0, 0);
		Reg.precreate = new Precreate();
		Reg.object1Array = new Array<FlxSprite>();
		Reg.worldArray = new Array<FlxSprite>();
		for (i in 0...4)
		{
			Reg.worldArray.push(new World(FlxG.width * i, FlxG.height, 1));
			Reg.lastPlatformX = Std.int(Reg.worldArray[i].x + FlxG.width);
		}
		Reg.interfaz = new Interface(0, FlxG.height - Std.int(FlxG.height / 10));
		FlxG.debugger.visible = true;
	}

	override public function update(elapsed:Float):Void
	{
		//FlxG.worldBounds.set(FlxG.camera.screen.x, FlxG.camera.screen.y, FlxG.camera.screen.x + FlxG.width, FlxG.camera.screen.y + FlxG.height);
		super.update(elapsed);
	}
}
