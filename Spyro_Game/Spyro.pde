import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Spyro
{
  Sprite sprite;
  int lives;
  float timer;
  boolean right = false;
  boolean left= false;
  boolean jump = false;
  int gravity;



  Spyro (PApplet app) 
  {
    sprite = new Sprite(app, "WALK RIGHT LEFT TURN.gif", 31, 1, 3);
    sprite.setScale(5);
    sprite.setXY(width/2, 675);
    sprite.setVisible(true);
    timer = 0;
    gravity = 2;
    
  }



  void moveRight () 
  {
    //sprite.setVelX(70);
    sprite.setFrameSequence(0, 8, 0.1);
    right = true;
    if (left == true)
    {
      sprite.setFrameSequence(22, 26, 0.2);
      left = false;
    }
  }

  void moveLeft () 
  {
    //sprite.setVelX(-70);
    sprite.setFrameSequence(17, 9, 0.1);
    left = true;
    if (right == true)
    {
      sprite.setFrameSequence(18, 21, 0.2);
      right = false;
    }
  }

  void stopMovingRight ()
  {
    sprite.stopImageAnim();
    sprite.setVelX(0);
    sprite.setFrame(0);
  }
  void stopMovingLeft ()
  {
    sprite.stopImageAnim();
    sprite.setVelX(0);
    sprite.setFrame(17);
  }

  void jumpUp () 
  {
   sprite.setVelY (-200);
}

void jumpDown ()
{
  sprite.setVelY(70);
  
}

void stopJump()
{
  sprite.setY (675);
}

    Sprite getSprite()
    {
      return sprite;
    }
  }