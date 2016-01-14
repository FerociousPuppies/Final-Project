import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Enemy 
{
  Sprite sprite;

  
  Enemy (PApplet app) {
    sprite =new Sprite (app, "EnemyRam.png", 6, 1, 10);
    sprite.setScale(3);
    sprite.setXY(300,500);
    sprite.setVisible(true);
    
    
  }
  
  void show ()
  {
    sprite.setVelX(70);
    sprite.setFrameSequence(3, 5, 0.2);
    
  }
    
  
  
  
}