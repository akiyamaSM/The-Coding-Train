import processing.sound.*;


class Jumper
{
  SoundFile jump;
  float x = 1;
  float y = -4;
  
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
}
