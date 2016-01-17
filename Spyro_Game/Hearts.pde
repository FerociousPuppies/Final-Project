import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Heart {
  
  Sprite sprite;

  Heart (PApplet app, String pic, int x, int y)
  {
    sprite = new Sprite (app, pic, 2); 
    sprite.setScale (.25);
    sprite.setXY (x, y);
  } 
  
  void looseHeart ()
  {
    sprite.setVisible(false);
  }

  
   Sprite getSprite()
  {
    return sprite;
  }
  
  
  
  
}