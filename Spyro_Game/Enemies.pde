import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

static class Enemy 
{
  Sprite sprite;
  boolean reverse = false;
  float timer;

  Enemy (PApplet app, String pic, int x, int y, int scale) 
  {
    sprite =new Sprite (app, pic, 12, 1, 3);
    sprite.setScale(scale);
    sprite.setXY(x, y);
    sprite.setVisible(true);
    timer = 0;
  }
//have the enemies walk back and forth
  void show ()
  {
    timer ++;
    if (timer < 100)
    {
      sprite.setVelX(70);
      sprite.setFrameSequence(9, 11, 0.2);
    }
    if (timer > 100)
    {
      sprite.setVelX(-70);
      sprite.setFrameSequence(6, 8, 0.2);
    }
    if (timer == 200)
    {
      reverse = true;
    }
    if (reverse)
    {
      timer = 0;
      reverse = false;
    }
  }
  //found spyro attack
  void getSpyroToLeft ()
  {
    timer = 500;
    sprite.setVelX(-200);
  }
  
  void getSpyroToRight ()
  {
    timer = 500;
    sprite.setVelX(200);    
  }
  
  //be able to get the sprite's location and scale and velocity
  Sprite getSprite()
  {
   return sprite; 
  }
}