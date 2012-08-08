package map
{
	import Data.AllRefs;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.filters.GlowFilter;

	public class NPC extends ObjectView
	{
		
		public var gridWidth:Number = 100;
		public var gridHeight:Number = 100;
		public var bd:BitmapData;
		
		public var NPCId:int = 0;
		public var NPCName:String = "NPC";
		public var Remark:String;
		
		private var isCopy:Boolean = false;
		
		public function NPC()
		{
			super();
		}
		
		private function initMe() : void
		{
			this.changeName(this.NPCName);
			nameTxt.filters = [new GlowFilter(0, 1, 4, 4, 1.5, 2)];
			return;
		}// end function
		
		override public function set source(param1:String) : void
		{
			image.addEventListener("init", this.initABG);
			super.source = param1;
			return;
		}// end function
		
		
		private function initABG(event:Event) : void
		{
			image.removeEventListener("init", resetSize);
			image.removeEventListener("init", this.initABG);
			this.bd = Bitmap(image.content).bitmapData.clone();
			image.width = this.bd.width;
			image.height = this.bd.height;
			resetSize(image.width, image.height);
			this.changeName(this.NPCName);
			AllRefs.mapMaker.NPCSetPanelIns.init();
			return;
		}// end function
		
		/**
		 * 	修改名字
		 **/ 
		public function changeName(param1:String) : void
		{
			nameTxt.text = param1;
			NPCName = param1;
			nameTxt.x = this.width / 2 - nameTxt.width / 2;
			return;
		}// end function
		
	}
}