static final int BRICK_ID = 0;
static final int FOREST_ID = 1;
static final int WOOD_ID = 1; //both names make sense in certain situations, so we'll just have both.
static final int WHEAT_ID = 2;
static final int SHEEP_ID = 3;
static final int ORE_ID = 4;
static final int DESERT_ID = 5;
int BOARDPOINT_CLICK_RADIUS = 20;
int segmentThickness = 10;
PShape[] tileShapes = new PShape[6];

static final int[] roadCost = new int[5];
static final int[] settlementCost = new int[5];
static final int[] cityCost = new int[5];
static final int[] devCardCost = new int[5];
static
{
  setCosts();
}
void setup()
{
  size(800, 600);
  loadShapes();
}

void draw()
{ 
}

void mousePressed()
{
}

void keyPressed()
{
}

void loadShapes()
{
 tileShapes[BRICK_ID] = loadShape("catbrick.svg");
 tileShapes[FOREST_ID] = loadShape("catforest.svg");
 tileShapes[WHEAT_ID] = loadShape("catwheat.svg");
 tileShapes[SHEEP_ID] = loadShape("catsheep.svg");
 tileShapes[ORE_ID] = loadShape("catore.svg"); 
 tileShapes[DESERT_ID] = loadShape("catdesert.svg");
}

static void setCosts() //This SHOULD go in a static block in Player, but Java's dumb about static inner stuff, so it can't.
{
  roadCost[BRICK_ID] = 1;
  roadCost[WOOD_ID] = 1;
  settlementCost[BRICK_ID] = 1;
  settlementCost[WOOD_ID] = 1;
  settlementCost[WHEAT_ID] = 1;
  settlementCost[SHEEP_ID] = 1;
  cityCost[WHEAT_ID] = 2;
  cityCost[ORE_ID] = 3;
  devCardCost[SHEEP_ID] = 1;
  devCardCost[ORE_ID] = 1;
  devCardCost[WHEAT_ID] = 1;
}

