class City implements PointStruct
{
  Player owner;
  static final float RESOURCE_MULTIPLIER = 2.0;
  City(Player owner)
  {
    this.owner = owner;
  }
  
  Player getOwner()
  {
    return owner;
  }
  
  float getResourceMultiplier()
  {
    return RESOURCE_MULTIPLIER;
  }
}
