import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Sprite spyro, logo, logo2, ng, hs, control;
enum State {
  TITLE, GAME, BONUS, GAMEOVER
};
  State gameState;
  StopWatch sw;
  PImage bg;

void setup()
{
  size(1200, 800);
  gameState = State.GAME;
  sw = new StopWatch();
  
  logo = new Sprite(this, "Spyro_logo.png", 1);
  logo.setXY(width/2, height/2 - 150);
  logo.setScale(2);
  logo2 = new Sprite(this, "logo2.png", 1);
  logo2.setXY(width/2, height/2 + 50);
  logo2.setScale(1);
  ng = new Sprite(this, "newGame.png", 1);
  ng.setXY(width/2, height/2 + 200);
  ng.setScale(2);
  hs = new Sprite(this, "highScore.png", 1);
  hs.setXY(width/2+150, height/2 + 300);
  hs.setScale(2);
  control = new Sprite(this, "controls.png", 1);
  control.setXY(width/2-150, height/2 + 300);
  control.setScale(2);
  
  registerMethod("pre", this);
  
}

/*
Drawing is done here
*/
void draw()
{
  if (gameState == State.GAME)
  {
    background(0);
  }
  S4P.drawSprites();
}

/*
 * Method provided by Processing and is called every 
 * loop before the draw method. It has to be activated
 * with the following statement in setup() <br>
 * <pre>registerMethod("pre", this);</pre>
 */
public void pre() {
  // Calculate time difference since last call
  float elapsedTime = (float) sw.getElapsedTime();
  S4P.updateSprites(elapsedTime);
}