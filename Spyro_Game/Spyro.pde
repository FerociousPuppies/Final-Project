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
    sprite = new Sprite(app, "WalkingTran.gif", 27, 1, 3);
    sprite.setScale(5);
    sprite.setXY(width/2, y);
    sprite.setVisible(true);
    timer = 0;
    y = 1;
    
  }


//have the sequence of spyro sprite move so it looks like its moving right   
  void moveRight () 
  {
    sprite.setFrameSequence(0, 8, 0.1);
    right = true;
    if (left == true)
    {
      sprite.setFrameSequence(22, 26, 0.2);
      left = false;
    }
  }
//have the squence of spyro sprite move so it looks like hes moving left
  void moveLeft () 
  {
    sprite.setFrameSequence(17, 9, 0.1);
    left = true;
    if (right == true)
    {
      sprite.setFrameSequence(18, 21, 0.2);
      right = false;
    }
  }
//have spyro stop moving
  void stopMovingRight ()
  {
    sprite.stopImageAnim();
    sprite.setVelX(0);
    sprite.setFrame(0);
  }
  
  //have spyro stop moving
  void stopMovingLeft ()
  {
    sprite.stopImageAnim();
    sprite.setVelX(0);
    sprite.setFrame(17);
  }
//have spyro jump
  void jumpUp () 
  {
   sprite.setVelY (-900);
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
  }
 //have spyro come back down 
  void flyDown ()
  {
   sprite.setVelY(300); 
  }
  //be able to get the sprite's location and scale and velocity
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
  
  void notMove ()
  {
   sprite.setVelXY (0,0); 
    
  }




}