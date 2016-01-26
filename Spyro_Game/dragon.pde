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
  
  void invisible ()
  {
    sprite.setVisible (false);
  }
  
  Sprite getSprite()
  {
   return sprite; 
  }
  
}