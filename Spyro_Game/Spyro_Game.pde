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
ArrayList <Platform> platforms;
int score;
boolean left;
int counter;
boolean fire = false;
boolean jump = false;
int timer;


void setup()
{
  size(1200, 800);
  gameState = State.GAME;
  sw = new StopWatch();
  x=2962;
  score = 0;
  remove = new ArrayList();
  counter = 0;
  timer = 0;

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
  e.add(new Enemy(this, "EnemyRam.png", 200, 675, 3));
  e.add(new Enemy(this, "Enemy.png", 800, 675, 3));


  gems = new ArrayList <Gem> ();
  gems.add(new Gem (this, "RedGems.png", 900, 300, 3));

  fireballs = new ArrayList <Fireball> ();
  fireballs.add(new Fireball (this, "fireball.png", width/2, 675, 3));
  
  hearts = new ArrayList <Heart> ();
  hearts.add (new Heart (this, "heart.png", 900, 50));
  hearts.add (new Heart (this, "heart.png", 1000, 50));
  hearts.add (new Heart (this, "heart.png", 1100, 50));

  platforms = new ArrayList <Platform> ();
  platforms.add (new Platform (this, "platform.jpg", 800, 725, 1));

  spyro = new Spyro(this);

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
  fill(0);
  textSize (72);
  text ("Score", width/2 - 200, 100, 3);
  text (score, width/2, 100, 1);
  S4P.drawSprites();
  for (int i = 0; i < e.size(); i++)
  {
    e.get(i).show();
  }
  if (jump == true)
  {
   timer++;
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
        for (Enemy i : e)
        {
          i.getSprite().setX(i.getSprite().getX () - 10);
        }
        for (Platform p : platforms)
        {
          p.getSprite().setX(p.getSprite().getX () - 10);
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
        break;
      }
    case UP:
      { 
        spyro.jumpUp();
        
        spyro.jumpDown();
        
        spyro.stopJump();
      

        break;
      }
    case DOWN:
      {for (Fireball f : fireballs)
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
}

void processCollisions()
{
  //If Spyro is in contact with an enemy, have both characters move back and loose hearts
  for (Enemy i : e)
  {
    for (Heart h : hearts)
    {
      if (i.getSprite().pp_collision(spyro.getSprite()))
      {
        if (left == false){
        i.getSprite().setX(i.getSprite().getX() + 50);
        x += 50;
        h.looseHeart ();
      }
      if (left == true ) 
      {
        i.getSprite().setX(i.getSprite().getX() - 50);
        x -= 50;
        h.looseHeart ();
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
      x += 10;
    }
  }
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