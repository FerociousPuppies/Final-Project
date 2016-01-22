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
  int y;



  Spyro (PApplet app, int y) 
  {
    sprite = new Sprite(app, "WALK RIGHT LEFT TURN.gif", 31, 1, 3);
    sprite.setScale(5);
    sprite.setXY(width/2, y);
    sprite.setVisible(true);
    timer = 0;
    y = 1;
    
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
   sprite.setVelY (-700);
}

void stopMovingUp () 
{
 sprite.setVelY (0); 
}
void stopMovingDown ()
{
  sprite.setVelY(0);
}

  void flyUp ()
  {
   sprite.setVelY (-300); 
  }
  
  void flyDown ()
  {
   sprite.setVelY(300); 
  }
  
    Sprite getSprite()
    {
      return sprite;
    }
  
  void invisible ()
  {
    sprite.setVisible (false);
  }
  
  void visible () 
  {
   sprite.setVisible (true); 
  }




}