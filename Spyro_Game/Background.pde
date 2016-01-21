import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Background 
{
  Sprite sprite;
  
  Background (PApplet app, int x, int y)
  {
    sprite = new Sprite (app, "clouds.jpg", 1);
    sprite.setXY (x , y);
    
  }
  
  void invisible ()
  {
   sprite.setVisible(false); 
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