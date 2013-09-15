package Data
{
	import Modules.MapMain;
	
	import flash.utils.Dictionary;
	
	import map.ChangMap;
	import map.NPC;
	import map.ObjectView;
	import map.ObjectsLayer;
	
	import mx.collections.ArrayCollection;
	import mx.utils.XMLUtil;

	public class DocumnetEncodeAndDecode extends Object
	{

		public function DocumnetEncodeAndDecode()
		{
			return;
		} // end function

		public static function encode() : String
		{
			
			var mapXML : XML = new XML(<Map></Map>);
			mapXML.@Name = AllRefs.mapName;
			
			mapXML.@MapWidth = Math.ceil(AllRefs.backBitmap.width / AllRefs.mapPieceSize) * AllRefs.mapPieceSize;
			mapXML.@MapHeight = Math.ceil(AllRefs.backBitmap.height / AllRefs.mapPieceSize) * AllRefs.mapPieceSize;
			mapXML.@OffsetX = AllRefs.backBitmap.width - Math.ceil(AllRefs.backBitmap.width / AllRefs.mapPieceSize) * AllRefs.mapPieceSize;
			mapXML.@OffsetY = AllRefs.backBitmap.height - Math.ceil(AllRefs.backBitmap.height / AllRefs.mapPieceSize) * AllRefs.mapPieceSize;
			
			mapXML.@Description = AllRefs.mapDescription ;
			//地图掩码数据
			mapXML.appendChild(<Floor>{AllRefs.mapDataToString()}</Floor>);
			//小地图块大小、行列数
			mapXML.Floor.@TileWidth = AllRefs.gridWidth;
			mapXML.Floor.@TileHeight = AllRefs.gridHeight;
			mapXML.Floor.@Row = AllRefs.length;
			mapXML.Floor.@Col = AllRefs.length;
			mapXML.Floor.@OffsetX= 0;
			if(AllRefs.ReadOffsetY == 0)
			{
				mapXML.Floor.@OffsetY= Math.ceil(AllRefs.backBitmap.height / AllRefs.gridHeight);
			}else
			{
				mapXML.Floor.@OffsetY = AllRefs.ReadOffsetY;
			}
			//NPC数据
			var layerListData : ArrayCollection = AllRefs.mapMain.objectsLayer.layerListData;
			var len:int = layerListData.length;
			var i:int = 0;
			var npcXML:XML;
			var objectView:ObjectView;
			var changMap:ChangMap;
			var npc:NPC;
			//转场数据转换成xml
			for( i = 0; i < len; i++ )
			{
				objectView = layerListData.getItemAt(i).targetObj;
				if(objectView is ChangMap)
				{
					changMap = objectView as ChangMap;
					npcXML = new XML(<Element></Element>);
					npcXML.@To = changMap.NPCId;
					npcXML.@X = changMap.A_x;
					npcXML.@Y = changMap.A_y;
					mapXML.appendChild(npcXML);
				}
			}
			//NPC数据转换成xml
			for( i = 0; i < len; i++ )
			{
				objectView = layerListData.getItemAt(i).targetObj;
				if(objectView is NPC)
				{
					npc = objectView as NPC;
					npcXML = new XML(<Location></Location>);
					npcXML.@Id = npc.NPCId;
					npcXML.@Name = npc.NPCName;
					npcXML.@X = npc.A_x;
					npcXML.@Y = npc.A_y;
					npcXML.@Remark = npc.Remark;
					mapXML.appendChild(npcXML);
				}
			}
			
			return mapXML.toXMLString();
		} // end function

		public static function decode(mapXML : XML) : void
		{
			AllRefs.mapName = mapXML.@Name;
			AllRefs.mapMaker.mapName.text = AllRefs.mapName;
			AllRefs.mapDescription = mapXML.@Description;
			AllRefs.mapMaker.mapDescription.text = AllRefs.mapDescription;
			
			//解析掩码
			AllRefs.stringToMapData(mapXML.Floor.children()[0]);
			//解析各种参数
			var gridWidth:int =  mapXML.Floor.@TileWidth; 
			var gridHeight:int = mapXML.Floor.@TileHeight;
			var mapWidth:int = int(mapXML.@MapWidth) + int(mapXML.@OffsetX);
			var mapHeight:int = int(mapXML.@MapHeight) + int(mapXML.@OffsetY);
			mapWidth = Math.ceil(mapWidth / gridWidth) * gridWidth;
			mapHeight = Math.ceil(mapHeight / gridHeight) * gridHeight;
			
			AllRefs.isInitMap = true;
			
			/****** 哎。。。写的这么纠结 完全为了与原来的地图编译器兼容 *******/
			AllRefs.mapMain.reSetSize(mapWidth, mapHeight, gridWidth, gridHeight);
			
			AllRefs.length = mapXML.Floor.@Row;
			AllRefs.mapWidth = mapWidth;
			AllRefs.mapHeight = mapHeight;
			AllRefs.gridWidth = gridWidth;
			AllRefs.gridHeight = gridHeight;
			AllRefs.allGridWidth = gridWidth * AllRefs.length;
			AllRefs.allGridHeight = gridHeight * AllRefs.length;
			
			AllRefs.ReadOffsetY = mapXML.Floor.@OffsetY;
			
			var defultOffsetY:int = Math.ceil(AllRefs.backBitmap.height / AllRefs.gridHeight);
			AllRefs.mapMain.backGround.x = (AllRefs.ReadOffsetY - defultOffsetY) * AllRefs.gridWidth / 2;
			AllRefs.mapMain.backGround.y = -(AllRefs.ReadOffsetY - defultOffsetY) * AllRefs.gridHeight / 2;
			
			//初始化格子与网格
			AllRefs.gridLayer.drawAll(mapWidth, mapHeight, gridWidth, gridHeight);
			//解析转换场景
			var changMap:Dictionary = new Dictionary();
			var elementlen:int = mapXML.Element.length();
			var i:int = 0;
			for( i = 0; i< elementlen;i++)
			{
				changMap[String(mapXML.Element[i].@To)] = true;
			}
			//解析与创建NPC
			AllRefs.mapMain.objectsLayer.deleteAllChangMap();
			AllRefs.mapMain.objectsLayer.deleteAllNPC();
			AllRefs.mapMain.objectsLayer.layerListData = new ArrayCollection();
			var locationLen:int = mapXML.Location.length();
			for(i = 0; i< locationLen;i++)
			{
				var obj:Object={};
				obj.Id=mapXML.Location[i].@Id;
				obj.Name=mapXML.Location[i].@Name;
				obj.X=mapXML.Location[i].@X;
				obj.Y=mapXML.Location[i].@Y;
				obj.Remark=mapXML.Location[i].@Remark;
				//true 表示为转换场景
				if(changMap[String(obj.Id)])
				{
					AllRefs.mapMain.objectsLayer.addDetailChangMap(obj);
				}
				else
				{
					AllRefs.mapMain.objectsLayer.addDetailNPC(obj);
				}
			}
			
			AllRefs.isInitMap = false;
			return;
		} // end function


	}
}
