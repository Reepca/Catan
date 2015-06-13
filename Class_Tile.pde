class Tile extends Node
{ 
  static final int TILE_CLICK_PRIORITY = 0;
  int tileID;
  Segment[] memberSegments;
  Tile(int tileID, Point location)
  {
    super(location);
    this.tileID = tileID;
  } 
  
  Tile(int tileID, Point location, Segment[] memberSegments)
  {
    super(location);
    this.tileID = tileID;
    this.memberSegments = memberSegments;
  }
  
  boolean containsPoint(Point testPoint)
  {
    return true;
  }

  
  void drawTile(int xcoord, int ycoord, int tileWidth, int tileHeight)
  {
    shape(tileShapes[tileID], visualCenter.x, visualCenter.y, tileWidth, tileHeight);
  }
  
  
  int getClickPriority()
  {
    return TILE_CLICK_PRIORITY;
  }
  
  int compareTo(Clickable other)
  {
    return this.getClickPriority() - other.getClickPriority();
  }
}
