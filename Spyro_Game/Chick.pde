import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Chick
{ 
  Sprite sprite;
  
  Chick (PApplet app, int x, int y)
  {
    sprite = new Sprite (app, "bird .png", 4, 4,1);
    sprite.setXY(x,y);
  }
  
  void flyLeft ()
  {
   sprite.setFrameSequence(0, 3, 0.1);
   sprite.setVelX (-70); 
  }
   Sprite getSprite()
  {
   return sprite; 
  }
}