import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Spyro
{
  //Sprite sprite;
  //int lives;

  Spyro () 
  {
    
  }




    void moveRight () {
      spryo.setVelX(70);
      spyro.setFrameSequence(0, 9, 0.1);
    }

    void moveLeft () {
      spyro.setVelX(-70);
      spyro.setFrameSequence(0, 9, 0.1);
    }
  
}