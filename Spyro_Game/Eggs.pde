import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Egg
{ 
  Sprite sprite;
  float random;
  
  Egg(PApplet app, float x, float y)
  {
    sprite = new Sprite (app, "Egg.png", 1);
    sprite.setXY(x,y);
    sprite.setScale (1);
    random = random (0,2);
    sprite.setVelX (-70);
  }
  
  void flyingEggs ()
  {
    if (random > 1)
    {
    sprite.setVelY(-7);
  }
  else
  {
    sprite.setVelY (7);
    
  }
  }
  
   Sprite getSprite()
  {
   return sprite; 
  }
}