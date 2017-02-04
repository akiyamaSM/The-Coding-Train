class Hole
{

  float tall = GROUND;
  float wid;
  float where;
  float SPACE = width;
  Hole()
  {
    wid = random(110, 150);
  }

  void getPosition(Person p)
  {
    where = SPACE + p.location.x;
  }

  void display()
  {
    fill(25);
    stroke(25);
    rect(where, (height - tall), wid, tall);
  }
  

  boolean touchedBy(Person p)
  {
    int xPosition = (int)(p.location.x + p.wid);
    
    if ((xPosition >= (int)(where)) && (xPosition <= (int)(where + wid) ))
    {
      int yPosition = (int)(p.location.y);
      
      if (!(yPosition < (int)(height - GROUND - tall)))
      {
        return true;
      }
    }

    return false;
  }

  boolean gotJumpedBy(Person p)
  {
    return int(p.location.x) > int(where+ wid);
  }
  
  boolean personIn(Person p)
  {
    return int(p.location.y - p.tall) < int(height);
  }
}
