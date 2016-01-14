import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Enemy 
{
  Sprite sprite;

  
  Enemy (PApplet app) 
  {
    sprite =new Sprite (app, "EnemyRam.png", 6, 1, 1);
    sprite.setScale(3);
    sprite.setXY(300,500);
    sprite.setVisible(false);
    
    
  }
  
  void show ()
  {
    sprite.setVelX(-70);
    sprite.setFrameSequence(0,2, 0.2);
    
  }
    
  
  
  
}