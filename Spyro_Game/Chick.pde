import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Chick
{ 
  Sprite sprite;
  
  Chick (PApplet app, float x, float y)
  {
    sprite = new Sprite (app, "bird .png", 4, 4,1);
    sprite.setXY(x,y);
    sprite.setScale (2);
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
  
   void invisible ()
  {
    sprite.setVisible (false);
  }
  
  void visible ()
  {
    sprite.setVisible (true);
  }
}