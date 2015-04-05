class Segment extends Node
{
  static final int SEGMENT_CLICK_PRIORITY = 1;
  BoardPoint pointA;
  BoardPoint pointB;
  static int segmentThickness = 10;
  float yInterceptDisplacement;
  float perpSlope;
  RLine segment;
  RLine parallelTop, parallelBot, perpLeft, perpRight;
  Point top, left, bottom, right;
  
  Segment(BoardPoint pointA, BoardPoint pointB)
  {
    this.pointA = pointA;
    this.pointB = pointB;
    assignExtremes();
    segment = new RLine(pointA.getVisualLocation(), pointB.getVisualLocation());
    perpSlope = -(pow(segment.getSlope(), -1));
    yInterceptDisplacement = abs(segmentThickness * sin(atan(perpSlope)));
    parallelTop = new RLine(segment.getSlope(), segment.getYIntercept() + yInterceptDisplacement);
    parallelBot = new RLine(segment.getSlope(), segment.getYIntercept() - yInterceptDisplacement);
    perpLeft = new RLine(perpSlope, (float)(pointA.getVisualLocation().y - segment.getSlope() * pointA.getVisualLocation().x));
    perpRight = new RLine(perpSlope, (float)(pointB.getVisualLocation().y - segment.getSlope() * pointB.getVisualLocation().x);
  }
  
  private void assignHorizontalExtremes(BoardPoint pointA, BoardPoint pointB)
  {
    if(pointA.getVisualLocation().x < pointB.getVisualLocation().x)
    {
      right = pointB.getVisualLocation();
      left = pointA.getVisualLocation();
    } 
    else
    {
      right = pointA.getVisualLocation();
      left = pointB.getVisualLocation();
    }
  }
  
  private void assignVerticalExtremes(BoardPoint pointA, BoardPoint pointB)
  {
    if(pointA.getVisualLocation().y < pointB.getVisualLocation().y)
    {
      bottom = pointB.getVisualLocation();
      top = pointA.getVisualLocation();
    } 
    else
    {
      bottom = pointA.getVisualLocation();
      top = pointB.getVisualLocation();
    }
  }
  
  private void assignExtremes(BoardPoint pointA, BoardPoint pointB)
  {
    assignHorizontalExtremes();
    assignVerticalExtremes();
  }
  
  boolean containsPoint(Point testPoint)
  {
    
  }
  
  int getClickPriority()
  {
    return SEGMENT_CLICK_PRIORITY;
  }
}
