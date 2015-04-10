class Tile extends Node
{ 
  static final int TILE_CLICK_PRIORITY = 0;
  PShape[] tiles = new PShape[6];
  static
  {
    tiles[BRICK_ID] = loadShape("catbrick.svg");
    tiles[FOREST_ID] = loadShape("catforest.svg");
    tiles[WHEAT_ID] = loadShape("catwheat.svg");
    tiles[SHEEP_ID] = loadShape("catsheep.svg");
    tiles[ORE_ID] = loadShape("catore.svg");
    tiles[DESERT_ID] = loadShape("catdesert.svg");
  }
  
  Tile(PShape tile, Point location)
  {
    
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
