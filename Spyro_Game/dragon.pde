import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Dragon
{
  Sprite sprite;
  
  
  Dragon (PApplet app)
  {
    sprite = new Sprite (app, "BigSpriteswithDragons1.gif", 12, 6, 3);
    sprite.setXY (6000, 675);
    sprite.setScale (3);
  }
  //set visibility to false
  void invisible ()
  {
    sprite.setVisible (false);
  }
  //be able to get the sprite's location and scale and velocity
  Sprite getSprite()
  {
   return sprite; 
  }
  
}