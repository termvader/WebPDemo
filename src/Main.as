package 
{
	import sineysoft.WebpSwc;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Aziz K.
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "WebPImage.webp", mimeType = "application/octet-stream")]
		private const WebPImageClass:Class;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var bitmapData:BitmapData = WebpSwc.decode(new WebPImageClass() as ByteArray);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.scaleX = 0.5;
			bitmap.scaleY = 0.5;
			addChild(bitmap);
			// entry point
		}
		
	}
	
}