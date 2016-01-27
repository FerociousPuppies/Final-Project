import sprites.*;
import sprites.maths.*;
import sprites.utils.*;


class Instructions
{
  Sprite sprite;

  Instructions (PApplet app, String pic)
  {
    sprite = new Sprite (app, pic, 2); 
    sprite.setXY (600, 500);

  } 
  void invisible()
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