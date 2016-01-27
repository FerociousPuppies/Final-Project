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
  //set the visiblity to false
  void invisible ()
  {
   sprite.setVisible(false); 
  }
  //set the viibility to true
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