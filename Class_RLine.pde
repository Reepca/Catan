class RLine
{
 float slope;
 float yIntercept;
 float xValue; //An arbitrary x-point at which the line exists 
 Point endPointA;
 Point endPointB;
 boolean undefined;
 
 RLine(float slope, float yIntercept, float xValue)
 {
   this.slope = slope;
   this.yIntercept = yIntercept;
   undefined = (slope != slope);
   this.xValue = xValue;
 }
 
 
 RLine(Point endPointA, Point endPointB)
 {
   slope = ((float)endPointA.y - (float)endPointB.y) / ((float)endPointA.x - (float)endPointB.x);
   yIntercept = (float)endPointA.y - (slope * (float)endPointA.x); 
   this.endPointA = endPointA;
   this.endPointB = endPointB;
   undefined = (slope != slope);
 }
 
 
 boolean greaterThan(Point testPoint)
 {
   if(!undefined)
   {
     return ((float)testPoint.y > (slope * (float)testPoint.x) - yIntercept);
   }
   return (testPoint.);
 }
 
 
 boolean isOnLine(Point testPoint)
 {
   return ((float)testPoint.y == (slope * (float)testPoint.x) - yIntercept);
 }
 
 float getSlope()
 {
   return slope;
 }
 
 float getYIntercept()
 {
   return yIntercept;
 }
}
