package;
import flixel.FlxSprite;

class Reg
{
	inline static public var objectSize = 32;
	inline static public var characterAccelY = 10;
	inline static public var characterObj1 = -400;
	
	static public var velocityCam:Int = 150;
	static public var lastPlatformX:Int;
	
	static public var character:FlxSprite;
	static public var precreate:FlxSprite;
	static public var interfaz:FlxSprite;
	static public var object1Array:Array<FlxSprite>;
	static public var worldArray:Array<FlxSprite>;
}