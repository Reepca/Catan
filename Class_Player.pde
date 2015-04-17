import java.util.ArrayList;
class Player
{ 
  int[] resourceCounts = new int[5];
  int longestRoad;
  int victoryPoints;
  ArrayList<DevelopmentCard> ownedDevCards = new ArrayList<DevelopmentCard>();
  ArrayList<PointStruct> builtPointStructs = new ArrayList<PointStruct>();
  ArrayList<Road> builtRoads = new ArrayList<Road>();
  color playerColor;
  Player(color playerColor)
  {
    this.playerColor = playerColor;
  }
  
  void updateLongestRoad()
  {
    //TODO: add implementation that checks the length of this player's longest road, updates it, compares that to the length of the player 
    //that owns the longest road (5 if null). This method should be invoked on the player who builds a road whenever they build it, and 
    //on any players with roads next to a settlement that has just been built (in case it cuts a road apart) aside from the player that 
    //built the settlement.
  }
  
  void buildRoad(Segment buildOn)
  {
    boolean sufficientResources = true;
    for(int i = 0; i < roadCost.length; i++)
    {
      if(roadCost[i] < resourceCounts[i])
      {
        sufficientResources = false;
      }
    }
    
   
    
    if(sufficientResources)
    {
      builtRoads.add(new Road(this, buildOn));
      for(int i = 0; i < roadCost.length; i++)
      {
        resourceCounts[i] -= roadCost[i];
      }
    }
    
    else
    {
      println("insufficient resources");
    }
  }
  
}
