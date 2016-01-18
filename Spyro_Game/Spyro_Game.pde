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
ArrayList <Platform> platforms;
ArrayList <Drop> drop;
int score;
boolean left;
int counter;
boolean fire = false;
boolean jump = false;
int timer;
int y;
boolean jumping;
int gravity;
boolean onSomething;
int heartCounter;
PImage heart1;
PImage heart2;
PImage heart3;
boolean currentState = false;
boolean lastState = false;


void setup()
{
  size(1200, 800);
  gameState = State.GAME;
  sw = new StopWatch();
  x=1871;
  score = 0;
  remove = new ArrayList();
  counter = 0;
  timer = 0;
  y=675;
  gravity = 2;

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

  heart1 = loadImage ("heart.png");
  heart2 = loadImage ("heart.png");
  heart3 = loadImage ("heart.png");


  e = new ArrayList <Enemy>();
  e.add(new Enemy(this, "EnemyRam.png", 2200, 675, 3));
  e.add(new Enemy(this, "Enemy.png", 2800, 675, 3));


  gems = new ArrayList <Gem> ();
  gems.add(new Gem (this, "RedGems.png", 900, 300, 3));

  fireballs = new ArrayList <Fireball> ();
  fireballs.add(new Fireball (this, "fireball.png", width/2, y, 3));



  platforms = new ArrayList <Platform> ();
  platforms.add (new Platform (this, "platform.jpg", 1520, 575, 1));
  platforms.add (new Platform (this, "ArtisanPlaform.jpg", 665, 790, 1));
  platforms.add (new Platform (this, "ArtisanPlatform2.png", 2950, 790, 1));

  drop = new ArrayList <Drop> ();
  drop.add (new Drop (this));


  spyro = new Spyro(this, y);

  registerMethod("pre", this);

  for (Fireball f : fireballs)
  {
    f.invisible();
  }
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

  S4P.drawSprites();
  for (int i = 0; i < e.size(); i++)
  {
    e.get(i).show();
  }
  fill(0);
  textSize (72);
  text ("Score", width/2 - 200, 100, 3);
  text (score, width/2, 100, 1);
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
        for (Enemy i : e)
        {
          i.getSprite().setX(i.getSprite().getX () - 10);
        }
        for (Platform p : platforms)
        {
          p.getSprite().setX(p.getSprite().getX () - 10);
        }
        for (Gem g : gems)
        {
          g.getSprite().setX(g.getSprite().getX () - 10);
        }
        for (Drop d : drop)
        {
          d.getSprite().setX(d.getSprite().getX () - 10);
        }
        break;
      }
    case LEFT:
      {
        spyro.moveLeft();
        x += 10;
        left = true;
        for (Enemy i : e)
        {
          i.getSprite().setX(i.getSprite().getX () + 10);
        }
        for (Platform p : platforms)
        {
          p.getSprite().setX(p.getSprite().getX () + 10);
        }
        for (Gem g : gems)
        {
          g.getSprite().setX(g.getSprite().getX () + 10);
        }
        for (Drop d : drop)
        {
          d.getSprite().setX(d.getSprite().getX () + 10);
        }
        break;
      }
    case UP:
      {
        if (jump == false)
        {
        spyro.jumpUp();
        jump = true;
        onSomething = false;
        currentState = true;
        break;
      }
      }
    case DOWN:
      {
        for (Fireball f : fireballs)
        {
          f.visible();
        }
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
  if (keyCode == UP && gameState == State.GAME)
  {
    lastState = currentState;
    currentState = false;
  }
}

void processCollisions()
{

  //If Spyro is in contact with an enemy, have both characters move back and loose hearts
  for (Enemy i : e)
  {
    for (Platform p : platforms)
    {

      if (i.getSprite().pp_collision(spyro.getSprite()))
      {
        if (left == false) {
          i.getSprite().setX(i.getSprite().getX() + 50);
          p.getSprite().setX(p.getSprite().getX () + 50);
          x += 50;
        }
        if (left == true ) 
        {
          i.getSprite().setX(i.getSprite().getX() - 50);
          p.getSprite().setX(p.getSprite().getX () - 50);
          x -= 50;
        }
      }
    }
  }

  // If Enemy is in contact with a fireball, have enemy disappear and increase score
  for (Fireball f : fireballs)
  {
    for (Enemy i : e) 
    {
      if (f.getSprite().pp_collision(i.getSprite()))
      {
        i.getSprite().setVisible(false);
        f.getSprite().setVisible(false);
        remove.add(e.indexOf(i));
        f.reset();
        score += 200;
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
  for (Platform p : platforms) 
  {
    if (p.getSprite().bb_collision(spyro.getSprite()))
    {
      spyro.getSprite().setVelY(0);
      spyro.getSprite().setY(p.getSprite().getY() - p.getSprite().getHeight()/2 - spyro.getSprite().getHeight()/2);
      jump = false;
      onSomething = true;
    }
  }
  if (onSomething == false)
  {
    spyro.getSprite().setVelY(spyro.getSprite().getVelY() + gravity);
  }
  for (Drop d : drop)
  {
    if  (d.getSprite().bb_collision(spyro.getSprite()))
    {
      spyro.getSprite().setVelY (70);
    }
  }

  onSomething = false;
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