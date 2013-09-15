package Data
{
	import Modules.MapMain;
	import Modules.MapSetWindow;
	
	import flash.display.Bitmap;
	import flash.utils.getTimer;
	
	import inOut.FileChoser;
	
	import map.GridLayer;
	
	import mx.managers.FocusManager;

	/**
	 *
	 * @author Administrator
	 */
	public class AllRefs
	{

		/**
		 *	地图名字
		 **/
		public static var mapName:String = "";
		/**
		 *	地图描述 
		 */		
		public static var mapDescription:String = "";
		/**
		 *
		 * @default 格子在所有图层上面
		 */
		public static var isGridOnTop : Boolean = false;
		/**
		 *
		 * @default
		 */
		public static var mapMaker : MapEdit = null;
		/**
		 *
		 * @default 地图主界面
		 */
		public static var mapMain : MapMain = null;
		/**
		 *
		 * @default 格子
		 */
		public static var gridLayer : GridLayer = null;
		/**
		 *
		 * @return 地图设置窗口
		 */
		public static var mapSetWindow : MapSetWindow = null;
		/**
		 *
		 * @return 选择文件
		 */
		public static var fileChoser : FileChoser = null;
		/**
		 *	地图数据数组大小 length * length
		 */
		public static var length : uint = 0;
		/**
		 * 	地图宽度
		 **/
		public static var mapWidth : uint = 300;
		/**
		 *	地图高度
		 */
		public static var mapHeight : uint = 300;
		/**
		 *	单元格宽度
		 */
		public static var gridWidth : Number = 60;
		/**
		 *	单元格高度
		 */
		public static var gridHeight : Number = 30;
		/**
		 *	所有格子的总宽度
		 */
		public static var allGridWidth : Number = 0;
		/**
		 *	所有格子的总高度
		 */
		public static var allGridHeight : Number = 0;
		/**
		 *	背景文件路径
		 */
		public static var backgroundFilePath : String = null;
		/**
		 *	是否编辑掩码中
		 */
		public static var isEdit : Boolean = false;
		/**
		 * 	范围编辑掩码
		 **/
		public static var isAreaEdit : Boolean = false;
		/**
		 *	将要别画的格子的颜色
		 */
		public static var curWriteColor : uint = 0xFFFFFF;
		/**
		 *	将要别画的格子的类型
		 */
		public static var curWriteType : uint = 0;
		/**
		 *	是否启动画笔（可以画一条线）
		 */
		public static var isOpenDrawPen : Boolean = false;
		/**
		 *	所有格子的数组
		 */
		public static var allRefsArr : Array = null;
		/**
		 *	地图数据
		 */
		public static var mapData : Array = [];
		/**
		 *	背景图 
		 */		
		public static var backBitmap:Bitmap = null;
		/**
		 *	地图块大小 300 * 300
		 */		
		public static var mapPieceSize:uint = 300;
		/**
		 *	默认地图格子类型 
		 */		
		public static var defultGridType:int = 0;
		/**
		 *	有读取的xml文件初始化地图 
		 */		
		public static var isInitMap:Boolean = false;		
		
		/**
		 *	（0,0）格子 的坐标 
		 */		
		public static var ZeroX : Number = 0;
		public static var ZeroY : Number = 0;
		/**
		 *	游戏地图缩放比例配置列表 
		 */		
		public static var mapSacleList:Array = null;
		/**
		 *	掩码名称、类型、颜色配置数据 
		 */		
		public static var yanMaData:Array = null;
		/**
		 *	格子类型与颜色对应表 
		 */		
		public static var typeColors:Array = new Array();
		/**
		 *	文件中读取的地图偏移值 
		 */		
		public static var ReadOffsetY:int = 0;
		/**
		 * 	焦点管理器
		 **/ 
		public static var focusManager:FocusManager;
		/**
		 * 	地图文件地址
		 **/
		public static var mapDataPath:String = "";
		
		/**
		 *	初始化 
		 */		
		public static function init() : void
		{
			mapSetWindow = new MapSetWindow();
			fileChoser = new FileChoser();
//			mapSacleList = [{label: "缩放:12%", sacle: 0.125}, {label: "缩放:20%", sacle: 0.2}, {label: "缩放:25%", sacle: 0.25}, {label: "缩放:33%", sacle: 0.33}, {label: "缩放:50%", sacle: 0.5}, {label: "缩放:66%", sacle: 0.66}, {label: "缩放:70%", sacle: 0.7}, {label: "缩放:80%", sacle: 0.8}, {label: "缩放:90%", sacle: 0.9}, {label: "缩放:100%", sacle: 1}, {label: "缩放:200%", sacle: 2}, {label: "缩放:300%", sacle: 3}, {label: "缩放:400%", sacle: 4}, {label: "缩放:600%", sacle: 6}];
//			yanMaData = [{label: "通道:0",type:0,color:0xFFFFFF},{label: "阻挡:1",type:1,color:0xFF0000},{label: "半透明:2",type:2,color:0x00FF00},{label: "摆摊:3",type:3,color:0x00FF}];
			for each(var obj:Object in yanMaData)
			{
				AllRefs.typeColors[obj.type] = obj.color;
			}
		}
		/**
		 * 	mapData 数组转换为字符串
		 */		
		public static function mapDataToString():String
		{
			var i:int = 0;
			var len:int =  length * length;
			var str:String = "";
			str += mapData[0] == null ? defultGridType : mapData[0];
			for( i = 1; i < len; i++)
			{
				str += "," + (mapData[i] == null ? 0 : mapData[i]);
			}
			return str;
		}
		/**
		 * 	使字符串还原成数组
		 */	
		public static function stringToMapData(str:String):void
		{
			mapData = [];
			var arr:Array = str.split(",");
			var i:int = 0;
			var len:int = arr.length;
			for( i = 0; i < len ; i++)
			{
				mapData.push(int(arr[i]))
			}
		}
		
	}
}
