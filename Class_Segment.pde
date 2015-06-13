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
  Tile tileA, tileB;
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
    parallelB = segmentLine.getDisplacedParallelLine((float)-segmentThickness);
  }
  
  boolean placeRoad(Road toPlace) // returns true if a road was successfully placed
  {
    if(builtOnThisSegment != null)
    {
      this.builtOnThisSegment = toPlace;
      return true;
    }
    
    else
    {
      println("error: attempted to build a road on a Segment that already has a road");
      return false;
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
  
  Road getStructure()
  {
    return builtOnThisSegment;
  }
  /*
   *reflectTile: creates a new Tile that is on the opposite side of this segment, across from whichever Tile already exists (A or B)
   *if both Tiles already exist, nothing happens and an error message is printed. If neither Tile exists, an error message is printed.
   *
   */
  Tile reflectTile(int newTileID)
  {
    if(tileA == null) // in this case, we want to have the new tile be stored in tileA
    {
      if(tileB != null) //make sure there is a valid tile to reflect across
      {
        //create a new Tile in tileA that is on the side of this Segment that tileB is not on.
        
        //return the new Tile
      }else
      {
        println("error: neither Tile of this Segment exists, but reflectTile() was called");
      }
    }else //if tileA already exists 
    {
      if(tileB == null) //and tileB doesn't
      {
        //create a new Tile in tileB that is on the side of this Segment that tileB is not on
        
        //return the new Tile
      }else // if tileA and tileB both already exist
      {
        println("error: called reflectTile() on a segment that already has two tiles");
      }
    }
  }
}
