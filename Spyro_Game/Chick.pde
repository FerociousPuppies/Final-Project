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
  //make rhe chicks fly left
  void flyLeft ()
  {
   sprite.setFrameSequence(0, 3, 0.1);
   sprite.setVelX (-70); 
  }
  //be able to get the sprite's location and scale and velocity
   Sprite getSprite()
  {
   return sprite; 
  }
  //set the visibilty to false
   void invisible ()
  {
    sprite.setVisible (false);
  }
  //set the visibility to true
  void visible ()
  {
    sprite.setVisible (true);
  }
}