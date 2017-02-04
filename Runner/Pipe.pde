class Pipe
{
  float yHigh;
  float yLow;
  float where;
  float wid = 40;
  float sizeMin = 80;
  float SPACE = width;
  PImage pipeUP;
  PImage pipeDown;
  Pipe(PImage pipeUP, PImage pipeDown)
  {
    this.pipeUP = pipeUP;
    this.pipeDown = pipeDown;
  }
  
  void generate()
  {
    yHigh = random(2, width/2);
    yLow = yHigh + sizeMin;
    
    pipeUP.resize(int(wid), int(yHigh));
    pipeDown.resize(int(wid), int(height - yLow));
  }
  
  void getPosition(Person p)
  {
    generate();
    float locationX = p.location.x;
    where = SPACE  + locationX;
  }
  
  void display()
  {
    // UP BLOCK
    //fill(255);
    //rect(where, 0 , wid, yHigh);
    image(pipeUP, where, 0);
    
    
    // EMPTY
    //fill(25,25,25, 0);
    //stroke(25,25,25, 0);
    //rect(where, yHigh , wid, yLow);
    
    // DOWN
    //fill(225);
    //stroke(225);
    //rect(where, yLow , wid, (height ));
    image(pipeDown, where, yLow);
  }
  
  
  boolean touchedBy(Person p)
  {
    int xLocationLeft = int (p.location.x);
    int xLocationRight = int (xLocationLeft + p.wid);
    int yLocationDown = int(p.location.y);
    int yLocationUp = int(yLocationDown - p.tall);

    
    if(xLocationRight >= int(where) && (xLocationRight <= int(where + wid)))
    {

      if(yLocationUp < int(yHigh) ||  yLocationDown > int(yLow))
      {
        println("CASE1");
        return true;
      }
      
    }
    
    
    if(xLocationLeft >= int(where) && ( xLocationLeft <= int(where + wid)) )
    {
 
      if(yLocationUp < int(yHigh) ||  yLocationDown > int(yLow))
      {
        println("CASE2");
        return true;
      }
      
    }
    
    if(xLocationLeft >= int(where) && ( xLocationRight <= int(where + wid)) )
    {

      if(yLocationUp < int(yHigh) ||  yLocationDown > int(yLow))
      {
        println("CASE3");
        return true;
      }
    }
    
    return false;
  }
  
  boolean gotJumpedBy(Person p)
  {
    return int(p.location.x) > int(where + wid);
  }
}
