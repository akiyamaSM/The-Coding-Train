import processing.sound.*;

class Person
{
  PVector location;
  PVector acceleration;
  PVector velocity;
  int tall = 50;
  int wid = 30;
  float speed = 1;
  
  Jumper jumper;
  
  Person(Jumper jumper)
  {
    location = new PVector(10, height);
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
    rect(location.x, location.y-tall , wid, tall);
  }
  
  boolean hasLanded()
  {
    return (int) (location.y) == (int)height;
  }

  void edges(SoundFile landSound)
  {
    if (location.y > height) {
      velocity.y *= 0;
      velocity.x = speed;
      location.y = height;
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
}
