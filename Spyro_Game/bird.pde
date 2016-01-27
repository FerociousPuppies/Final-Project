import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Bird
{ 
  Sprite sprite;
  
  Bird (PApplet app, String pic, float x, float y, int scale)
  {
    sprite = new Sprite (app, pic,  12, 1, 3);
    sprite.setXY(x,y);
    sprite.setScale(scale);
  }
  //have the bird fly left
  void flyLeft ()
  {
   sprite.setFrameSequence(6, 8, 0.1);
   sprite.setVelX (-70); 
  }
  
  //be able to get the sprite's location and scale and velocity
   Sprite getSprite()
  {
   return sprite; 
  }
  //set visibility to false
   void invisible ()
  {
    sprite.setVisible (false);
  }
  //set visibility to true
  void visible ()
  {
    sprite.setVisible (true);
  }
  
  
}