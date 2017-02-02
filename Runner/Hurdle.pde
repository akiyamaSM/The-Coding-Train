class Hurdle
{
  float tall;
  float wid;
  float where = 350;
  int colorHurdle;
  Hurdle()
  {
    tall = random(20, 60);
    wid = random(10, 15);
    colorHurdle = int(random(0, 255));
    
  }
  
  void getPosition(Person p)
  {
    where = where + p.location.x;
  }
  
  void display()
  {
    fill(colorHurdle);
    rect(where, height-tall, wid, tall);
  }
  
  boolean touchedBy(Person p)
  {
    if((int)(p.location.x + p.wid) == (int)(where))
    {
      if((int)(p.location.y + p.tall) > (int)(height - tall))
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
}
