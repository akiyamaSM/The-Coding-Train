class Slower
{
  PVector top;
  PVector right;
  PVector left;
  float side = 10;
  float where;
  boolean isCreated = false;
  
  void getPosition(Person p)
  {
    where = random(width, 0.6 * width);
    where = where + 1.3 * p.location.x;
    top = new PVector(where, random(0.25*height, 0.80*height));
    isCreated = true;
  }

  void display()
  {
    right = new PVector(top.x + side, top.y + side);
    left = new PVector(top.x - side, top.y + side);
    fill(255, 62, 62);
    stroke(255, 62, 62);
    triangle(top.x, top.y, right.x, right.y, left.x, left.y);
    fill(255);
    stroke(255);

  }
  
  boolean isFruitCreated()
  {
    return isCreated;
  }
  
  
  boolean isFruitPassed(Person p)
  {
    return int(p.location.x) > int(top.x + side/2);
  }
  
  boolean hasBeenEatenBy(Person p)
  {
    int xLocationLeft = int(p.location.x);
    int xLocationRight =xLocationLeft + int(p.wid);
    
    int triangleRight = int(right.x);
    int triangleLeft = int(left.x);
    
    
    if(xLocationLeft < triangleRight)
    {
      if(xLocationRight > triangleLeft)
      {
        
        int yLow = int(p.location.y); 
        int yHigh = yLow - int(p.tall);
        
        int triangleLow = int(right.y);
        int triangleHigh = int(top.y);
        
        
        if(yHigh >= triangleHigh && yHigh <= triangleLow )
        {
          isCreated = false;
          return true;
        }
        
        if(yLow >= triangleHigh && yLow <= triangleLow )
        {
          isCreated = false;
          return true;
        }
      }
    }
    
    return false;
  }
  
}
