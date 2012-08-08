package map
{
	import Data.AllRefs;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.Group;

	public class ObjectsLayer extends Group
	{

		public var layerListData : ArrayCollection;

		public function ObjectsLayer()
		{
			this.layerListData = new ArrayCollection();
			this.width = 400;
			this.height = 300;
		}

		/**
		 * 	添加NPC
		 **/
		public function addNPC(param1 : String) : NPC
		{
			var npc : NPC = new NPC();
			npc.source = param1;
			this.addElement(npc);
			var obj : * = new Object();
			obj.label = npc.NPCName;
			obj.targetObj = npc;
			this.layerListData.addItemAt(obj, 0);
			AllRefs.mapMaker.objectsList.dataProvider = this.layerListData;
			AllRefs.mapMaker.objectsList.selectedIndex = 0;
			AllRefs.mapMain.selectObj = npc;
			return npc;
		}

		/**
		 * 	添加NPC  带各种参数
		 **/
		public function addDetailNPC(obj : Object) : NPC
		{
			var npc : NPC = new NPC();
			npc.NPCId = obj.Id;
			npc.NPCName = obj.Name;
			npc.A_x = obj.X;
			npc.A_y = obj.Y;
			npc.AtoXY();
			npc.Remark = obj.Remark;
			
			npc.source = "images/NPC.png";
			this.addElement(npc);
			var obj : * = new Object();
			obj.label = npc.NPCName;
			obj.targetObj = npc;
			this.layerListData.addItemAt(obj, this.layerListData.length);
			AllRefs.mapMaker.objectsList.dataProvider = this.layerListData;
			AllRefs.mapMaker.objectsList.selectedIndex = 0;
			AllRefs.mapMain.selectObj = npc;
			return npc;
		}
		
		/**
		 * 	删除所有NPC
		 **/ 
		public function deleteAllNPC():void
		{
			AllRefs.mapMaker.NPCSetPanelIns.visible = false;
			var len:int = this.layerListData.length;
			while(len > 0)
			{
				var obj:Object = this.layerListData.getItemAt(--len);
				if((obj.targetObj is NPC) && !(obj.targetObj is ChangMap))
				{
					this.removeElement(obj.targetObj);
					AllRefs.mapMaker.updateList(0, obj.targetObj);
				}
			}
		}
		
		/**
		 * 	添加转场
		 **/
		public function addChangMap(param1 : String) : ChangMap
		{
			var changMap : ChangMap = new ChangMap();
			changMap.source = param1;
			this.addElement(changMap);
			var obj : * = new Object();
			obj.label = changMap.NPCName;
			obj.targetObj = changMap;
			this.layerListData.addItemAt(obj, 0);
			AllRefs.mapMaker.objectsList.dataProvider = this.layerListData;
			AllRefs.mapMaker.objectsList.selectedIndex = 0;
			AllRefs.mapMain.selectObj = changMap;
			return changMap;
		}
		
		/**
		 * 	添加转场  带各种参数
		 **/
		public function addDetailChangMap(obj : Object) : ChangMap
		{
			var changMap : ChangMap = new ChangMap();
			changMap.NPCId = obj.Id;
			changMap.NPCName = obj.Name;
			changMap.A_x = obj.X;
			changMap.A_y = obj.Y;
			changMap.AtoXY();
			changMap.Remark = obj.Remark;
			
			changMap.source = "images/ZC.png";
			this.addElement(changMap);
			var obj : * = new Object();
			obj.label = changMap.NPCName;
			obj.targetObj = changMap;
			this.layerListData.addItemAt(obj, this.layerListData.length);
			AllRefs.mapMaker.objectsList.dataProvider = this.layerListData;
			AllRefs.mapMaker.objectsList.selectedIndex = 0;
			AllRefs.mapMain.selectObj = changMap;
			return changMap;
		}
		
		/**
		 * 	删除所有转场
		 **/ 
		public function deleteAllChangMap():void
		{
			AllRefs.mapMaker.NPCSetPanelIns.visible = false;
			var len:int = this.layerListData.length;
			while(len > 0)
			{
				var obj:Object = this.layerListData.getItemAt(--len);
				if(obj.targetObj is ChangMap)
				{
					this.removeElement(obj.targetObj);
					AllRefs.mapMaker.updateList(0, obj.targetObj);
				}
			}
		}
	}
}
