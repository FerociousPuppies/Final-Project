import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class SpyroFlying
{
  Sprite sprite;



  SpyroFlying (PApplet app, int y) 
  {
    sprite = new Sprite(app, "Flying tran.gif", 16, 1, 3);
    sprite.setScale(5);
    sprite.setXY(width/2, y);
    sprite.setVisible(true);
  }

  //spyro stop moving up
  void stopMovingUp () 
  {
    sprite.setVelY (0);
  }
  //spyro stop moving down
  void stopMovingDown ()
  {
    sprite.setVelY(0);
  }
  //have spyro jump up
  void flyUp ()
  {
    sprite.setVelY (-300);
    sprite.setFrameSequence(1, 16, .1);
  }
  //have spyro come back down 
  void flyDown ()
  {
    sprite.setVelY(300);
    sprite.setFrameSequence(1, 16, .1);
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