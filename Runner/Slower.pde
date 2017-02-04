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
    where = random(width, width + width/2);
    where = where + p.location.x;
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
  
  
  boolean hasBeenEatenBy(Person p)
  {
    return true;
  }
  
}
