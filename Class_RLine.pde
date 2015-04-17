class RLine
{
  //Ax + By = C standard form
  //Slope = -A / B
  //y-intercept = C/B
  //x-intercept = C/A
  //slope = rise / run, rise / run = -A / B, rise = -A, run = B
 float A;
 float B;
 float C;
 private float slope;
 
 RLine(float A, float B, float C)
 {
   slope = -A / B;
   this.A = A;
   this.B = B;
   this.C = C;
 }
 
 
 RLine(Point endPointA, Point endPointB)
 {
   A = -((float)endPointA.y - (float)endPointB.y);
   B = ((float)endPointA.x - (float)endPointB.x);
   C = (float)endPointA.x * A + (float)endPointA.y * B;
   slope = ((float)endPointA.y - (float)endPointB.y) / ((float)endPointA.x - (float)endPointB.x);
 }
 
 
 boolean greaterThan(Point testPoint)
 {
   return (((float)testPoint.x * A + (float)testPoint.y * B) > C);
 }
 
 
 boolean isOnLine(Point testPoint)
 {
   return (((float)testPoint.x * A + (float)testPoint.y * B) == C);
 }
 
 float getSlope()
 {
   return slope;
 }
 
 RLine getPerpLine()
 {
   //in a slope-intercept line, to make it perpendicular you just take the opposite inverse of it ( -1 / it). In a standard form equation,
   //we don't explicitly have the slope - but we can infer it. We know that the slope is equal to -A / B, therefore to get a perpendicular
   //line we *should* just need to swap A and B around, and multiply B by -1.
   return new RLine(-B, A, C);
 }
 
 RLine getPerpLine(Point passesThroughThis)
 {
   float newC = -B * (float)passesThroughThis.x + A * (float)passesThroughThis.y;
   return new RLine(-B, A, newC);
 }
 
 RLine getDisplacedParallelLine(float displacement)
 {
    RLine perpLine = getPerpLine();
 }
 
 /*
 Thinking about standard form in terms of slope-intercept form:
 Ax + By = C
 y-intercept = C / B
 x-intercept = C / A
 y-intercept + D = C/B + D
 y-intercept * B = C = x-intercept * A
 I want to change the y-intercept just by modifying C. 
 y-intercept + y-displacement = (C + something) / B
 y-displacement * B = something
 x-displacement * A = something
 What is A?
 What is B?
 What is C?
 A: negative RISE
 B: RUN
 C: 
 
 */
 
}
