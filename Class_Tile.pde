class Tile extends Node
{ 
  static final int TILE_CLICK_PRIORITY = 0;
  int tileID;
  Tile(int tileID, Point location)
  {
    this.tileID = tileID;
  }
  
  boolean containsPoint(Point testPoint)
  {
    
  }

  
  void drawTile(int xcoord, int ycoord, int tileWidth, int tileHeight)
  {
    shape(tile, xcoord, ycoord, tileWidth, tileHeight);
  }
  
  
  int getClickPriority()
  {
    return TILE_CLICK_PRIORITY;
  }
}
