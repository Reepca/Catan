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
    //Remember the parameters
    this.pointA = pointA;
    this.pointB = pointB;
    //Set references to which points are lowest and highest in each dimension
    assignExtremes();
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
    perpLeft = new RLine(perpSlope, (float)(left.y - segment.getSlope() * left.x));
    perpRight = new RLine(perpSlope, (float)(right.y - segment.getSlope() * right.x);
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
}
