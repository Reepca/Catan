class RLine
{
 float slope;
 float yIntercept;
 float xValue; //An arbitrary x-point at which the line exists 
 Point endPointA;
 Point endPointB;
 
 RLine(float slope, float yIntercept, float xValue)
 {
   this.slope = slope;
   this.yIntercept = yIntercept;
   if(slope != slope)
   {
     this.slope = Integer.MAX_VALUE;
   }
   this.xValue = xValue;
 }
 
 
 RLine(Point endPointA, Point endPointB)
 {
   if(((float)endPointA.x - (float)endPointB.x) == 0)
   {
     this.slope = Integer.MAX_VALUE;
   }
   else
   {
     this.slope = ((float)endPointA.y - (float)endPointB.y) / ((float)endPointA.x - (float)endPointB.x);
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
