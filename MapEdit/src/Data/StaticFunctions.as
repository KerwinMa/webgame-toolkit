package Data
{
	import flash.geom.Point;

	public class StaticFunctions
	{
		public static var AstarToxyArr : Array = new Array();

		public static function clearAStarMap() : void
		{
			AstarToxyArr = new Array();
		}

		/**
		 * 	真实坐标转换为A*坐标
		 **/
		public static function xyToAStarXY(point : Point) : Point
		{
			var x1 : Number = point.x;
			var y1 : Number = point.y;
			//相对A*点（0,0）
			x1 = (x1 - AllRefs.ZeroX) * 2 / AllRefs.gridWidth;
			y1 = (y1 - AllRefs.ZeroY) * 2 / AllRefs.gridHeight;
			//A*点
			var A_x : int = (x1 + y1) / 2;
			var A_y : int = (x1 - y1) / 2;

			return new Point(A_x, A_y);
		}

		/**
		 * 	A*坐标转换为真实坐标
		 *
		 */
		public static function AstarXYToxy(point : Point) : Point
		{
			if (AstarToxyArr[point.x * AllRefs.length + point.y] == null)
			{
				var x : int = AllRefs.ZeroX + (point.x + point.y) * AllRefs.gridWidth / 2;
				var y : int = AllRefs.ZeroY + (point.x - point.y) * AllRefs.gridHeight / 2;
				AstarToxyArr[point.x * AllRefs.length + point.y] = new Point(x, y);
			}
			return AstarToxyArr[point.x * AllRefs.length + point.y];
		}
	}
}
