class RLine
{
 float slope;
 float yIntercept;
 Point endPointA;
 Point endPointB;
 
 RLine(float slope, float yIntercept)
 {
   this.slope = slope;
   this.yIntercept = yIntercept;
   if(slope != slope)
   {
     slope = Float.MAX_VALUE;
   }
 }
 
 
 RLine(Point endPointA, Point endPointB)
 {
   slope = ((float)endPointA.y - (float)endPointB.y) / ((float)endPointA.x - (float)endPointB.x);
   if(slope != slope)
   {
     slope = Float.MAX_VALUE;
   }
   yIntercept = (float)endPointA.y - (slope * (float)endPointA.x); 
   this.endPointA = endPointA;
   this.endPointB = endPointB;
 }
 
 
 boolean greaterThan(Point testPoint)
 {
     return ((float)testPoint.y > (slope * (float)testPoint.x) - yIntercept);
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
