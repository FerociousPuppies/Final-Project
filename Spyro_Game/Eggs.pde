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
  }
  
  void flyingEggs ()
  {
   sprite.setVelX (-10);
  }
  
   Sprite getSprite()
  {
   return sprite; 
  }
}