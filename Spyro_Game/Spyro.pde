import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Spyro
{
  Sprite sprite;
  int lives;

  Spyro (PApplet app) 
  {
    sprite = new Sprite(app, "walking2.png", 18, 1, 1);
    sprite.setScale(5);
    sprite.setXY(300, 300);
    sprite.setVisible(true);
  }




  void moveRight () {
    sprite.setVelX(70);
    sprite.setFrameSequence(0, 8, 0.1);
  }

  void moveLeft () {
    sprite.setVelX(-70);
    sprite.setFrameSequence(17, 9, 0.1);
  }
  
  void stopMovingRight (){
    sprite.stopImageAnim();
    sprite.setVelX(0);
    sprite.setFrame(0);
}
  void stopMovingLeft (){
    sprite.stopImageAnim();
    sprite.setVelX(0);
    sprite.setFrame(17);
  }
}