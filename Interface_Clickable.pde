import java.awt.Point;

interface Clickable
{
  boolean containsPoint(Point testPoint);
  int getClickPriority();
}
