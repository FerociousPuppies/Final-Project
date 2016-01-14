import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Enemy 
{
  Sprite sprite;
  boolean reverse = true;
  float timer;
  
  Enemy (PApplet app) 
  {
    sprite =new Sprite (app, "EnemyRam.png", 6, 1, 1);
    sprite.setScale(3);
    sprite.setXY(600,500);
    sprite.setVisible(true);
    timer = 0;
    
    
  }
  
  void show ()
  {
    if (reverse = false)
    {
    println("here");
    sprite.setVelX(70);
    sprite.setFrameSequence(3,5, 0.2);
    timer ++;
    
    }
    if (timer == 10)
    {
      println (timer);
      reverse = true;

    }
    if (reverse = true)
    {
    sprite.setVelX(-70);
    sprite.setFrameSequence(0,2, 0.2);
    println ("hello");
    }
    if (sprite.X == 500)
    {
     reverse = false; 
    }
  }
    
  
  
  
}