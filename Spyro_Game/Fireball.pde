import sprites.*;
import sprites.maths.*;
import sprites.utils.*;


class Fireball
{
  Sprite sprite;

  Fireball (PApplet app, String pic, int x, int y, int scale)
  {
    sprite = new Sprite (app, pic, 6, 1, 3); 
    sprite.setScale (scale);
    sprite.setXY (x, y);
  } 
  //give velocity to the fireball
  void fireLeft ()
  {
    sprite.setVelXY (-400, 0);
    sprite.setFrameSequence(5, 0, .2);
  }

  void fireRight ()
  {
    sprite.setVelXY (400, 0);
    sprite.setFrameSequence(0, 5, .2);
  }

//be able to get the sprite's location and scale and velocity
  Sprite getSprite()
  {
    return sprite;
  }
//set visibility to true
  void visible ()
  {
    sprite.setVisible(true);
  }
  //set visibility to false
  void invisible () 
  {
    sprite.setVisible(false);  
  }
  
}