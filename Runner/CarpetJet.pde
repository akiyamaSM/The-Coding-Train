class CarpetJet
{
  float tall;
  float wid;
  float where = 300;
  float yPosition;
  
  float speed = 5; 
  CarpetJet()
  {
    tall = 4;
    wid = random(40, 60);
  }
  
  void getPosition(Person p)
  {
    where = where + p.location.x;
    yPosition = (height - GROUND - 40);
  }
  
  void display()
  {
    strokeWeight(5);
    fill(255);
    stroke(255);
    rect(where, yPosition, wid, tall);
    strokeWeight(1);
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
  
  boolean getOnBy(Person p)
  {

    int xLocationLeft = int(p.location.x);
    int xLocationRight = int(xLocationLeft + p.wid);
    
    if(xLocationRight < int(where))
    {
      return false;
    }
    
    if(xLocationLeft >= int(where + wid))
    {
      return false;
    }
    
    int yLocationLow = int(p.location.y) +1;
    
    
    if(yLocationLow - int(yPosition) != 0  )
    {
      return false;
    }
    
    return true;
  }
  
  void flyBy(Person p)
  {
    where = where + p.velocity.x;
  }
  
  
  void flyUp(Person p)
  {
    yPosition = yPosition - speed;
  }
  
    void flyDown(Person p)
  {
    yPosition = yPosition + speed;
  }
  
}
