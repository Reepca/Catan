class Segment extends Node
{
  static final int SEGMENT_CLICK_PRIORITY = 1;
  BoardPoint pointA;
  BoardPoint pointB;
  float yInterceptDisplacement;
  float perpSlope;
  RLine segment;
  RLine parallelTop, parallelBot, perpLeft, perpRight;
  Point top, left, bottom, right;
  Road builtOnThisSegment = null;
  
  Segment(BoardPoint pointA, BoardPoint pointB)
  {
    super(new Point((pointA.getVisualLocation().x + pointB.getVisualLocation().x) / 2, (pointA.getVisualLocation().y + pointB.getVisualLocation().y) / 2));
    //Remember the parameters
    this.pointA = pointA;
    this.pointB = pointB;
    //initialize a line that represents the geometry of this segment
    segment = new RLine(pointA.getVisualLocation(), pointB.getVisualLocation());
    //find the slope of a line perpendicular to this segment
    perpSlope = -(pow(segment.getSlope(), -1));
    //determine, based on the perpendicular displacement (segmentThickness), how much the parallel lines need to be vertically displaced.
    yInterceptDisplacement = abs(segmentThickness * sin(atan(perpSlope)));
    //Displace (and create) the parallel lines accordingly
    parallelTop = new RLine(segment.getSlope(), segment.getYIntercept() + yInterceptDisplacement); //visually lower in processing
    parallelBot = new RLine(segment.getSlope(), segment.getYIntercept() - yInterceptDisplacement); //visually higher in processing
    //create lines perpendicular to the endpoints 
    perpA = segment.getPerpLine(pointA.getVisualLocation());
    perpB = segment.getPerpLine(pointB.getVisualLocation());
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
    assignHorizontalExtremes(pointA, pointB);
    assignVerticalExtremes(pointA, pointB);
  }
  
  boolean containsPoint(Point testPoint)
  {
    
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
