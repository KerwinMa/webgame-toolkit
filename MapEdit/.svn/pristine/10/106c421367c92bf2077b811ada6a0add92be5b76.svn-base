package inOut
{
	import Data.AllRefs;

	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.FileFilter;

	/**
	 *
	 * @author Administrator
	 */
	public class FileChoser
	{
		private var file : File;

		/**
		 * 选择背景图片
		 */
		public function choseBackGround() : void
		{
			this.file = new File();
			var _loc_1 : * = new FileFilter("flash支持的图像文件", "*.jpg;*.jpeg;*.png;*.gif");
			this.file.addEventListener(Event.SELECT, this.setFilePath);
			this.file.browseForOpen("选择文件", [_loc_1]);
			return;
		} 

		private function setFilePath(event : Event) : void
		{
			AllRefs.mapMain.setBackground(this.file.url);
			return;
		} 

		
		public function addBackGroundObject() : void
		{
			this.file = new File();
			var _loc_1:* = new FileFilter("flash支持的图像文件", "*.jpg;*.jpeg;*.png;*.gif");
			this.file.addEventListener(Event.SELECT, this.setFilePath2);
			this.file.browseForOpen("选择文件", [_loc_1]);
			return;
		}
		
		private function setFilePath2(event:Event) : void
		{
			AllRefs.mapMain.addBackgroundObject(this.file.url);
			return;
		}
		
		/**
		 *	添加NPC 
		 **/
		public function importNPC() : void
		{
			AllRefs.mapMain.addNPC("images/NPC.png");
			return;
			
			this.file = new File();
			var _loc_1:* = new FileFilter("flash支持的图像文件", "*.jpg;*.jpeg;*.png;*.gif");
			this.file.addEventListener(Event.SELECT, this.setFilePath5);
			this.file.browseForOpen("选择对NPC图像文件", [_loc_1]);
			return;
		}
		
		private function setFilePath5(event:Event) : void
		{
			AllRefs.mapMain.addNPC(this.file.url);
			return;
		}
		
		/**
		 * 	添加转场图片
		 **/ 
		public function importChangMap() : void
		{
			AllRefs.mapMain.addChangMap("images/ZC.png");
			return;
		}
	}
}
