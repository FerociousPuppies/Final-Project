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
  void show ()
  {
    sprite.setVelXY (-15, 0);
    sprite.setFrameSequence(0, 5, .2);
  }
  
  Sprite getSprite()
  {
    return sprite;
  }
}