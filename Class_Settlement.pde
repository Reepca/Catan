class Settlement implements PointStruct
{
  Player owner;
  static final float RESOURCE_MULTIPLIER = 1.0;
  Settlement(Player owner)
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
