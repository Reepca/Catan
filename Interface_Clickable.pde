import java.awt.Point;

interface Clickable extends Comparable<Clickable> 
{
  boolean containsPoint(Point testPoint);
  int getClickPriority();
  int compareTo(Clickable other);
}
