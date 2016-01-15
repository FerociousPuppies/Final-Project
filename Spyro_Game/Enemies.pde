import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Enemy 
{
  Sprite sprite;
  boolean reverse = false;
  float timer;
  
  Enemy (PApplet app) 
  {
    sprite =new Sprite (app, "Enemy.png", 6, 1, 1);
    sprite.setScale(3);
    sprite.setXY(600,500);
    sprite.setVisible(true);
    timer = 0;
    
    
  }
  
  void showRam ()
  {
    timer ++;
    if (timer < 150)
    {
    sprite.setVelX(70);
    sprite.setFrameSequence(3,5, 0.2);

    }
    if (timer > 150)
    {
    sprite.setVelX(-70);
    sprite.setFrameSequence(0,2, 0.2);
    }
    if (timer == 300)
    {
    reverse = true;
    }
    if (reverse)
    {
     timer = 0;
     reverse = false;
    }
  }
    
    void showSnake ()
  {
    timer ++;
    if (timer < 150)
    {
    sprite.setVelX(70);
    sprite.setFrameSequence(3,5, 0.2);

    }
    if (timer > 150)
    {
    sprite.setVelX(-70);
    sprite.setFrameSequence(0,2, 0.2);
    }
    if (timer == 300)
    {
    reverse = true;
    }
    if (reverse)
    {
     timer = 0;
     reverse = false;
    }

}
  
    
  
  
  
}