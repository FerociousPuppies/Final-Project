import sprites.*;
import sprites.maths.*;
import sprites.utils.*;


class Gem 
{
  Sprite sprite;

  Gem (PApplet app, String pic, int x, int y, int scale)
  {
    sprite = new Sprite (app, pic, 5, 1, 3); 
    sprite.setScale (scale);
    sprite.setXY (x, y);
  } 
  void show ()
  {
    sprite.setVelXY (-15, 0);
    sprite.setFrameSequence(0, 4, .2);
  }
  Sprite getSprite()
  {
    return sprite;
  }
}