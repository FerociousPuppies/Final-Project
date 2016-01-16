import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Sprite logo, logo2, ng, hs, control, background_picture;
enum State {
  TITLE, GAME, BONUS, GAMEOVER
};
  State gameState;
StopWatch sw;
PImage bg;
Spyro spyro;
Gem gems;
int x;
ArrayList remove;

ArrayList <Enemy> e;


void setup()
{
  size(1200, 800);
  gameState = State.GAME;
  sw = new StopWatch();
  x=0;

  remove = new ArrayList();

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

  logo.setVisible(false);
  logo2.setVisible(false);
  ng.setVisible(false);
  hs.setVisible(false);
  control.setVisible(false);

  e = new ArrayList <Enemy>();


  background_picture = new Sprite (this, "Artisans800.png", 1);
  background_picture.setXY(0, 0);
  background_picture.setScale(2);

  e.add(new Enemy(this, "EnemyRam.png", 100, 300, 3));
  e.add(new Enemy(this, "Enemy.png", 200, 600, 3));

  spyro = new Spyro(this);

  registerMethod("pre", this);
}

/*
Drawing is done here
 */
void draw()
{
  if (gameState == State.GAME)
  {
    background(255);
    background_picture.setXY(x, 0);
  }
  S4P.drawSprites();
  for (Enemy i : e)
  {
    i.show();
  }
}

/*
The keyPressed method processes keyboard input to control Spyro's 
 movements.
 
 UP -> Make Spyro jump
 DOWN -> Crouch to avoid enemies
 LEFT -> Move Spyro to the left
 RIGHT -> Move Spyro to the right
 SPACEBAR -> Shoot fireball
 */
void keyPressed()
{
  if (gameState == State.GAME)
  {
    switch(keyCode)
    {
    case RIGHT:
      {
        spyro.moveRight ();
        x -= 10;
        break;
      }
    case LEFT:
      {

        spyro.moveLeft();
        x += 10;
        break;
      }
    case UP:
      {
        spyro.jump();
        break;
      }
    case DOWN:
      {
        break;
      }
    case ' ':
      {
        break;
      }
    }
  }
}
void keyReleased()
{
  if (keyCode == RIGHT  && gameState == State.GAME)
  {
    spyro.stopMovingRight();
  }
  if (keyCode == LEFT  && gameState == State.GAME)
  {
    spyro.stopMovingLeft();
  }
}

void processCollisions()
{
 for(Enemy i : e)
 {
  if(i.getSprite().pp_collision(spyro.getSprite()))
  {
    i.getSprite().setVisible(false);
    remove.add(e.indexOf(i));
  }
 }
 for(Object i : remove)
 {
   e.remove(i);
 }
 remove.clear();
//for (Fireball f : fareballs)
//{
 //for (Enemy 1 : e) 
 //{
   //if(fireball.getSprite().pp_collision(i.getSprite())
   //{
     //i.getSprite().setVisble(false);
     //fireball.getSprtie().setVisible(false);
     //remove.add(e.indexOf(i));
     //}
     //}
     //}
     //for(Object i : remove)
 //{
   //e.remove(i);
 //}
 //remove.clear();
/*for (Gem g : gems)
{if (g.getSprite().pp_collision(sptro.getSprite()))
{
  g.gteSprite().setVisible(false);
  remove.add(gems.indexOf(g));
}
}
 for(Object i : remove)
 {
   e.remove(i);
 }
 remove.clear();
}
*/
}
     
     
   



/*
 * Method provided by Processing and is called every 
 * loop before the draw method. It has to be activated
 * with the following statement in setup() <br>
 * <pre>registerMethod("pre", this);</pre>
 */
public void pre() {
  // Calculate time difference since last call
  processCollisions();
  float elapsedTime = (float) sw.getElapsedTime();
  S4P.updateSprites(elapsedTime);
}