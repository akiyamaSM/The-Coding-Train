import processing.sound.*;

class Person
{
  PVector location;
  PVector acceleration;
  PVector velocity;
  int tall = 50;
  int wid = 30;
  float speed = 1;
  boolean inHole = false;
  boolean onCarpet = false;
  
  
  Jumper jumper;
  
  Person(Jumper jumper)
  {
    location = new PVector(10, height-GROUND);
    velocity = new PVector(speed, 0);
    acceleration = new PVector(0, 0);
    this.jumper = jumper;
  }

  void applyForce(PVector force)
  {
     acceleration.add(force);
  }

  void update()
  {  
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display()
  {
    fill(127);
    //rect(location.x, location.y-tall , wid, tall);
    frame = (frame+1)%numFrames;
    isOnJet();
    image(images[frame], location.x, location.y-tall);
  }
  
  boolean hasLanded()
  {
    return (int) (location.y) == (int)(height - GROUND);
  }

  void edges(SoundFile landSound)
  {
    if (!inHole && location.y > (height-GROUND)) {
      velocity.y *= 0;
      velocity.x = speed;
      location.y = height - GROUND;
      jumper.land(landSound);
    }
    
  }
  
  void jump(SoundFile jumpEffect)
  {
    applyForce(jumper.jump(jumpEffect));
  }
  
  void accelerate()
  {
    speed  = speed + 0.2;
    applyForce( new PVector(speed, 0));
  }
  
  PVector getVelocity()
  {
    return velocity;
  }
  
  void fall()
  {
    inHole = true;
    applyForce( jumper.fall());
    update();
    display();
  }
  
  void landOnJet(CarpetJet carpet)
  {
    velocity.y *= 0;
    onCarpet = true;
    location.y = carpet.yPosition;
  }
  
  
  boolean isOnJet()
  {
    if(onCarpet)
    {
      frame = 1;
      return true;
    }
    
    return false;
  }
}
