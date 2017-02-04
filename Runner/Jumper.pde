import processing.sound.*;


class Jumper
{
  SoundFile jump;
  float x = 0.98;
  float y = -3.567;
  
  boolean jumped = false;
  
  PVector jump(SoundFile jumpEffect)
  {
    if(hasJumped())
    {
      return new PVector(0, 0);
    }
    jumped = true;
    jumpEffect.play();
    return new PVector(x, y);
  }
  
  boolean hasJumped()
  {
    return jumped;
  }
  
  void land(SoundFile landSound)
  {
    if(jumped)
      landSound.play();
    jumped = false;
  }
  
  PVector fall()
  {
    return new PVector(0, 30);
  }
}
