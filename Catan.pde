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

Point endPointA = new Point (200, 200);
Point endPointB = new Point(100, 300);
Point visualCenter = new Point(int((endPointA.x + endPointB.x) / 2.0), int((endPointA.y + endPointB.y) / 2.0));
RLine testLine = new RLine(endPointA, endPointB);
RLine perpA = testLine.getPerpLine(endPointA);
RLine perpB = testLine.getPerpLine(endPointB);
RLine parallelA = testLine.getDisplacedParallelLine(20.0f);
RLine parallelB = testLine.getDisplacedParallelLine(-20.0f);
int clickCount = 0;
void setup()
{
  size(800, 600);
  loadShapes();
  line(endPointA.x, endPointA.y, endPointB.x, endPointB.y);
  Point testPoint = new Point(0, 0);
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      testPoint = new Point(x, y);
      if (perpA.greaterThan(testPoint) == perpA.greaterThan(visualCenter) && perpB.greaterThan(testPoint) == perpB.greaterThan(visualCenter))
      {
        //if testPoint and visualCenter are on the same side of parallelA and parallelB
        if (parallelA.greaterThan(testPoint) == parallelA.greaterThan(visualCenter) && parallelB.greaterThan(testPoint) == parallelB.greaterThan(visualCenter))
        {
          set(x, y, color(255, 0, 0));
          //println("valid place!");
        }
      }
    }
  }
  println("visualCenter:" + visualCenter.x + " , " + visualCenter.y);
  stroke(0);
  strokeWeight(4);
  testLine.drawSelf();
  perpA.drawSelf();
  perpB.drawSelf();
  parallelA.drawSelf();
  parallelB.drawSelf();
}

void draw()
{
  background(123);
  //endPointA = new Point (200, 200);
  endPointB = new Point(mouseX, mouseY);
  visualCenter = new Point(int((endPointA.x + endPointB.x) / 2.0), int((endPointA.y + endPointB.y) / 2.0));
  testLine = new RLine(endPointA, endPointB);
  perpA = testLine.getPerpLine(endPointA);
  perpB = testLine.getPerpLine(endPointB);
  parallelA = testLine.getDisplacedParallelLine(20.0f);
  parallelB = testLine.getDisplacedParallelLine(-20.0f);
  Point testPoint = new Point(0, 0);
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      testPoint = new Point(x, y);
      if (perpA.greaterThan(testPoint) == perpA.greaterThan(visualCenter) && perpB.greaterThan(testPoint) == perpB.greaterThan(visualCenter))
      {
        //if testPoint and visualCenter are on the same side of parallelA and parallelB
        if (parallelA.greaterThan(testPoint) == parallelA.greaterThan(visualCenter) && parallelB.greaterThan(testPoint) == parallelB.greaterThan(visualCenter))
        {
          set(x, y, color(255, 0, 0));
          //println("valid place!");
        }
      }
    }
  }
  println("visualCenter:" + visualCenter.x + " , " + visualCenter.y);
  stroke(0);
  strokeWeight(4);
  testLine.drawSelf();
  perpA.drawSelf();
  perpB.drawSelf();
  parallelA.drawSelf();
  parallelB.drawSelf();
}

void mousePressed()
{
  Point testPoint = new Point(mouseX, mouseY);
  //if testPoint and visualCenter are on the same side of perpA and perpB
  if (perpA.greaterThan(testPoint) == perpA.greaterThan(visualCenter) && perpB.greaterThan(testPoint) == perpB.greaterThan(visualCenter))
  {
    //if testPoint and visualCenter are on the same side of parallelA and parallelB
    if (parallelA.greaterThan(testPoint) == parallelA.greaterThan(visualCenter) && parallelB.greaterThan(testPoint) == parallelB.greaterThan(visualCenter))
    {
      println("SEGMENT WAS CLICKED!!" + (++clickCount) + " times!!!");
    }
  }
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

