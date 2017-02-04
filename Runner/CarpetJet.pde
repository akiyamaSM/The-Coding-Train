class CarpetJet
{
  float tall;
  float wid;
  float where = width;
  float yPosition;
  PImage carpet;
  float speed = 10;
  
  CarpetJet(PImage carpet)
  {
    tall = 10;
    wid = random(50, 60);
    carpet.resize((int) wid, (int) tall);
    this.carpet = carpet;
  }
  
  void getPosition(Person p)
  {
    where = width;
    where = where + p.location.x;
    yPosition = (height - GROUND - 40);
  }
  
  void display()
  {
    //strokeWeight(5);
    //fill(255);
    //stroke(255);
    //rect(where, yPosition, wid, tall);
    image(carpet, where, yPosition);
    //strokeWeight(1);
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
    
    int yLocationLow = int(p.location.y);
    
    
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
    p.location.y = p.location.y - speed;
  }
  
  void flyDown(Person p)
  {
    yPosition = yPosition + speed;
    p.location.y = p.location.y + speed;
  }
  
  
  void accelerateBy(Person p)
  {
    float speedFly  = p.speed + 0.001;
    p.applyForce( new PVector(speedFly, 0));
  }
  
  void slowDown(Person p)
  {
    float speedFly  = p.speed - 0.09;
    p.applyForce( new PVector(speedFly, 0));
  }
}
