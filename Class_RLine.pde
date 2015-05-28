class RLine
{
  //Ax + By = C standard form
  //Slope = -A / B
  //y-intercept = C/B
  //x-intercept = C/A
  //slope = rise / run, rise / run = -A / B, rise = -A, run = B
 public float A;
 public float B;
 public float C;
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
   //issue occurs when pointB is farther to left AND lower y-coordinate OR pointB is farther to right AND higher y-coordinate
   //So when A is negative AND B is positive OR when A is positive AND B is negative
   A = -((float)endPointA.y - (float)endPointB.y);
   B = ((float)endPointA.x - (float)endPointB.x);
   C = (float)endPointA.x * A + (float)endPointA.y * B;
   slope = ((float)endPointA.y - (float)endPointB.y) / ((float)endPointA.x - (float)endPointB.x);
 }
 
 
 boolean greaterThan(Point testPoint)
 {
   //Ax + By = C
   //-A / B = slope
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
    /*
    The slope of the perpendicular line (known) and the x-and-y components (unknown, xIntDisplace and yIntDisplace) of a certain length of 
    line (displacement, known) 
    form a similar triangle.
    To solve for the unknown, we only need to use the ratio of the hypotenuse to a certain component as a proportionality variable
    (the values shown below are equivalent to secant and cosecant, respectively)
    */
    float slopeHyp = sqrt(sq(perpLine.A) + sq(perpLine.B));
    println("A = " + A + " B = " + B + " C = " + C);
    println("slopeHyp = " + slopeHyp);
    float hypOverDX = slopeHyp / perpLine.B;
    println("hypOverDX = " + hypOverDX);
    float hypOverDY = slopeHyp / perpLine.A;
    println("hypOverDY = " + hypOverDY);
    //abs guarantees that lines with positive vs negative displacement will be on the opposite side of the original line
    //float xIntDisplace = signOf(displacement) * abs(displacement / hypOverDX);
    //float yIntDisplace = signOf(displacement) * abs(displacement / hypOverDY);
    float xIntDisplace = signOf(displacement) * abs(displacement / hypOverDX);
    float yIntDisplace = signOf(displacement) * abs(displacement / hypOverDY);
    println("xIntDisplace = " + xIntDisplace + ", yIntDisplace = " + yIntDisplace);
    //make a copy of this line, move it the calculated amount, return it.
    RLine parallelLine = this.clone();
    parallelLine.displaceLine(xIntDisplace, yIntDisplace);
    return parallelLine;
 }
 
 RLine clone()
 {
   return new RLine(A, B, C);
 }
 
 private float signOf(float x)
 {
   //returns 1 if positive, returns -1 if negative
   return x / abs(x);
 }
 
 void displaceLine(float xDisplace, float yDisplace)
 { 
   //NOTE: CURRENTLY THIS METHOD EXPECTS xDisplace AND yDisplace TO HAVE THE SAME SIGN.
   //x-intercept = C / A
   //so if I want to change the x-intercept by a certain amount... I must change C by an amount that takes into account A.
   //for example, if A = 3, and I want to increase the x-intercept by 5, then, since x-intercept = C / A, I would need to increase C
   //by 15, or displace*A. The same goes for y-intercept, only with B.
     
   //x-intercept = C/A
   //x-intercept + change = C/A + change
   //x-intercept + change = C/A + changeA/A
   //x-intercept + change = (C + (change * A)) / A
   
   float cDisplace = signOf(xDisplace) * abs(xDisplace * A); //signOf() and abs() are used to guarantee that both xDisplace and yDisplace
                                                           //have the same sign.
   if(cDisplace == cDisplace) //NaN test
   {
     C += cDisplace;
     println("C incremented by " + cDisplace + " based on xDisplace");
   }
   
   cDisplace = signOf(yDisplace) * abs(yDisplace * B);
   if(cDisplace == cDisplace) //NaN test
   {
     C += cDisplace; 
     println("C incremented by " + cDisplace + " based on yDisplace");
   }
 }
 
 void drawSelf()
 {
   //Ax + By = C
   //x = -B/Ay + C/A
   //y = -A/Bx + C/B
   Point drawPointA = new Point(0, int(C/B));
   Point drawPointB = new Point(width, int(-A/B * width + C/B));
   if(B ==0)
   {
     drawPointA = new Point(int(C/A), 0);
     drawPointB = new Point(int(C/A), height);
   }
   line(drawPointA.x, drawPointA.y, drawPointB.x, drawPointB.y);
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
 C: All I can say is "the position variable"... it defines the x and y intercepts implicitly.
 
 */
 
}
