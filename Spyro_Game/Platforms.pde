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
  
  void invisible ()
  {
   sprite.setVisible (false); 
  }
  
  void visible ()
  {
   sprite.setVisible(true); 
  }
  
  Sprite getSprite()
  {
   return sprite; 
  }
  
  
}