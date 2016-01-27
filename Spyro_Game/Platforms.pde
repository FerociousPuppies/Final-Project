import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Platform
{
  Sprite sprite;

  Platform (PApplet app, String pic, int x, int y, int scale)
  {
    sprite = new Sprite (app, pic, 3);
    sprite.setScale (scale);
    sprite.setXY (x, y);
  } 
  //set visibility to false
  void invisible ()
  {
   sprite.setVisible (false); 
  }
  //set visibility to true
  void visible ()
  {
   sprite.setVisible(true); 
  }
  //be able to get the sprite's location and scale and velocity
  Sprite getSprite()
  {
   return sprite; 
  }
  
  
}