class BoardPoint extends Node
{
  static final int BOARDPOINT_CLICK_PRIORITY = 2;
  Point visualLocation;
  static int BOARDPOINT_CLICK_RADIUS = 20;
  boolean containsPoint(Point testPoint)
  {
    return ((sq(visualLocation.x - testPoint.x) + sq(visualLocation.y - testPoint.y)) < sq(BOARDPOINT_CLICK_RADIUS));
  }
  
  int getClickPriority()
  {
    return BOARDPOINT_CLICK_PRIORITY;
  }
  
  Point getVisualLocation()
  {
    return visualLocation;
  }
}
