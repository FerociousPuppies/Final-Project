import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Sprite logo, logo2, ng, hs, control, backgroundPicture;
enum State {
  TITLE, GAME, BONUS, GAMEOVER
};
  State gameState;
StopWatch sw;
PImage bg;
Spyro spyro;
int x;
ArrayList remove;
ArrayList <Gem> gems;
ArrayList <Enemy> e;
ArrayList <Fireball> fireballs;
ArrayList <Heart> hearts;
int score;
boolean left;
int counter;

void setup()
{
  size(1200, 800);
  gameState = State.GAME;
  sw = new StopWatch();
  x=2962;
  score = 0;
  remove = new ArrayList();
  counter = 0;

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


  backgroundPicture = new Sprite (this, "Artisans.png", 1);



  e = new ArrayList <Enemy>();
  e.add(new Enemy(this, "EnemyRam.png", 1000, 675, 3));
  //e.add(new Enemy(this, "Enemy.png", 200, 600, 3));


  gems = new ArrayList <Gem> ();
  gems.add(new Gem (this, "RedGems.png", 900, 300, 3));

  fireballs = new ArrayList <Fireball> ();
  fireballs.add(new Fireball (this, "fireball.png", width/2, 675, 3));

  hearts = new ArrayList <Heart> ();
  hearts.add (new Heart (this, "heart.png", 900, 50));
  hearts.add (new Heart (this, "heart.png", 1000, 50));
  hearts.add (new Heart (this, "heart.png", 1100, 50));

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
    backgroundPicture.setXY(x, 400);
  }
  fill(0);
  textSize (72);
  text ("Score", width/2 - 200, 100, 3);
  text (score, width/2, 100, 1);
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
        left = false;
        break;
      }
    case LEFT:
      {

        spyro.moveLeft();
        x += 10;
        left = true;
        break;
      }
    case UP:
      {
        spyro.jump();
 
        break;
      }
    case DOWN:
      {
        if (left == true)
        {
          for (Fireball f : fireballs)
          {
            f.fireLeft ();
          }
        }
        if (left == false)
        {
          for (Fireball f : fireballs)
          {
            f.fireRight();
          }
        }

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
  for (Enemy i : e)
  {
    for (Heart h : hearts)
    {
      if (i.getSprite().pp_collision(spyro.getSprite()))
      {
        i.getSprite().setX(200);
        x -= 200;
        h.looseHeart ();
      }
    }
  }
  // If Spyro is in contact with a gem, have gem disappear and increase score
  for (Fireball f : fireballs)
  {
    for (Enemy i : e) 
    {
      if (f.getSprite().pp_collision(i.getSprite()))
      {
        i.getSprite().setVisible(false);
        f.getSprite().setVisible(false);
        remove.add(e.indexOf(i));
      }
    }
  }
  for (Object i : remove)
  {
    e.remove(i);
  }
  remove.clear();
  // If Spyro is in contact with a gem, have gem disappear and increase score
  for (Gem g : gems)
  {
    if (g.getSprite().pp_collision(spyro.getSprite()))
    {
      g.getSprite().setVisible(false);
      remove.add(gems.indexOf(g));
    }
  }
  for (Object i : remove)
  {
    e.remove(i);
    score += 100;
  }
  remove.clear();
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