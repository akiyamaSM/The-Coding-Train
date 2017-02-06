class Hurdle
{
  float tall;
  float wid;
  float where;
  float SPACE;
  int colorHurdle;
  PImage hurdle;
  
  
  Hurdle(PImage hurdle)
  {
    this.hurdle = hurdle;
  }
  
  void generate()
  {
    tall = random(40, 60);
    wid = random(10, 20);
    colorHurdle = int(random(0, 255));
    hurdle.resize(int(wid), int(tall));
  }
  
  void getPosition(Person p)
  {
    generate();
    SPACE = random(0.75 * width, width + width/3);
    where = SPACE + p.location.x;
  }
  
  void display()
  {
    //fill(colorHurdle);
    //rect(where, (height- GROUND -tall), wid, tall);
    image(hurdle, where, (height- GROUND -tall));
  }
  
  boolean touchedBy(Person p)
  {
   
    if((int)(p.location.x + p.wid) == (int)(where))
    {
      if(!((int)(p.location.y) < (int)(height - GROUND - tall)))
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
