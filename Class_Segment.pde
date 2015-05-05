class Segment extends Node
{
  static final int SEGMENT_CLICK_PRIORITY = 1;
  BoardPoint pointA;
  BoardPoint pointB;
  float yInterceptDisplacement;
  float perpSlope;
  RLine segmentLine;
  RLine parallelA, parallelB, perpA, perpB;
  Point top, left, bottom, right;
  Road builtOnThisSegment = null;
  
  Segment(BoardPoint pointA, BoardPoint pointB)
  {
    super(new Point((pointA.getVisualLocation().x + pointB.getVisualLocation().x) / 2, (pointA.getVisualLocation().y + pointB.getVisualLocation().y) / 2));
    //Remember the parameters
    this.pointA = pointA;
    this.pointB = pointB;
    //initialize a line that represents the geometry of this segment
    segmentLine = new RLine(pointA.getVisualLocation(), pointB.getVisualLocation());
    perpA = segmentLine.getPerpLine(pointA.getVisualLocation());
    perpB = segmentLine.getPerpLine(pointB.getVisualLocation());
    parallelA = segmentLine.getDisplacedParallelLine((float)segmentThickness);
  }
  
  void placeRoad(Road toPlace)
  {
    if(builtOnThisSegment != null)
    {
      this.builtOnThisSegment = toPlace;
    }
    
    else
    {
      println("error: attempted to build a road on a Segment that already has a road");
    }
  }
  
  boolean containsPoint(Point testPoint)
  {
    if(perpA.greaterThan(testPoint) == perpA.greaterThan(visualCenter) && perpB.greaterThan(testPoint) == perpB.greaterThan(visualCenter))
    {
      if(parallelA.greaterThan(testPoint) == parallelA.greaterThan(visualCenter) && parallelB.greaterThan(testPoint) == parallelB.greaterThan(visualCenter))
      {
        return true;
      }
    }
    return false;
  }
  
  int getClickPriority()
  {
    return SEGMENT_CLICK_PRIORITY;
  }
  
  int compareTo(Clickable other)
  {
    return this.getClickPriority() - other.getClickPriority();
  }
}
