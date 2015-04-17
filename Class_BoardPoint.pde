class BoardPoint extends Node
{
  static final int BOARDPOINT_CLICK_PRIORITY = 2;
  PointStruct placedOnThis = null;
  BoardPoint(Point visualCenter)
  {
    super(visualCenter);
  }
  
  boolean containsPoint(Point testPoint)
  {
    return ((sq(visualCenter.x - testPoint.x) + sq(visualCenter.y - testPoint.y)) < sq(BOARDPOINT_CLICK_RADIUS));
  }
  
  int getClickPriority()
  {
    return BOARDPOINT_CLICK_PRIORITY;
  }
  
  Point getVisualLocation()
  {
    return visualCenter;
  }
  
  int compareTo(Clickable other)
  {
    return this.getClickPriority() - other.getClickPriority();
  }
}
