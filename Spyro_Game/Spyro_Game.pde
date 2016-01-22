import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Sprite logo, logo2, ng, hs, control, backgroundPicture;
enum State {
  TITLE, GAME, BONUS, GAMEOVER, WIN
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
ArrayList <Tree> tree;
ArrayList <Background> background;
ArrayList <Bird> bird;
ArrayList <Chick> chick;
ArrayList <Egg> egg;
ArrayList <Dragon> dragon; 
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
int xb;
int press;
boolean fireReady = true;
int backgroundSW;
int gameoversw;


void setup()
{
  size(1200, 800);
  gameState = State.TITLE;
  sw = new StopWatch();
  x=3454;
  score = 0;
  remove = new ArrayList();
  counter = 0;
  timer = 0;
  y=675;
  gravity = 20;
  heartCounter = 3;
  xb = 2500;
  press = 0;
  backgroundSW = 0;
  gameoversw = 0;

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





  backgroundPicture = new Sprite (this, "Artisans.png", 1);
  backgroundPicture.setVisible (false);
  //backgroundPicture = new Sprite (this, "BeastMakers.png", 1);
  //backgroundPicture = new Sprite (this, "DreamWeavers.png", 1);
  //backgroundPicture = new Sprite (this, "Peacekeepers.png", 1);
  //backgroundPicture = new Sprite (this, "magicCrafters.jpg", 1);

  background = new ArrayList <Background> ();
  background.add(new Background (this, xb, 400));
  





  heart1 = loadImage ("heart.png");
  heart2 = loadImage ("heart.png");
  heart3 = loadImage ("heart.png");



  e = new ArrayList <Enemy>();
  e.add(new Enemy(this, "Line 105 Tran.gif", 2200, 700, 3));
  e.add(new Enemy(this, "Line 68 Tran.gif", 2800, 700, 3));


  /*e.add(new Enemy(this, "Hooded Guy Tran.gif", 2400, 100, 3));
   e.add(new Enemy(this, "Line 1 Tran.gif", 2200, 700, 3));
   e.add(new Enemy(this, "Line 28 Tran.gif", 2800, 700, 3));
   e.add(new Enemy(this, "Line 63 Trans.gif", 1200, 100, 3));
   e.add(new Enemy(this, "Line 66 Trans.gif", 2400, 100, 3));
   e.add(new Enemy(this, "Line 67 Tran.gif", 2200, 700, 3));
   e.add(new Enemy(this, "Line 69 Tran.gif", 2800, 700, 3));
   e.add(new Enemy(this, "Musroom Trans.gif", 1200, 100, 3));
   */


  bird = new ArrayList <Bird> ();
  bird.add(new Bird (this, "Line 4 Trans.gif", random (1200, 8000), random (0, 800), 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", random (1200, 8000), random (0, 800), 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", random (1200, 8000), random (0, 800), 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", random (1200, 8000), random (0, 800), 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", random (1200, 8000), random (0, 800), 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", random (1200, 8000), random (0, 800), 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", random (1200, 8000), random (0, 800), 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", random (1200, 8000), random (0, 800), 3));

  chick = new ArrayList <Chick> ();
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  
  
  egg = new ArrayList <Egg> ();
  egg.add(new Egg (this, 1200, 100));
  egg.add(new Egg (this, 2400, 100));




  gems = new ArrayList <Gem> ();
  gems.add(new Gem (this, "RedGems.png", 900, 600, 3));


  spyro = new Spyro(this, y);



  fireballs = new ArrayList <Fireball> ();
  fireballs.add(new Fireball (this, "fireball.png", (int) spyro.getSprite().getX(), y, 3));



  platforms = new ArrayList <Platform> ();
  platforms.add (new Platform (this, "platform.jpg", 1590, 650, 1));
  /*platforms.add (new Platform (this, "platform.jpg", 1520, 575, 1));
  platforms.add (new Platform (this, "platform.jpg", 1520, 575, 1));
  platforms.add (new Platform (this, "platform.jpg", 1520, 575, 1));
  platforms.add (new Platform (this, "platform.jpg", 1520, 575, 1));
*/
  platforms.add (new Platform (this, "ArtisanPlaform.jpg", 665, 790, 1));
  platforms.add (new Platform (this, "ArtisanPlatform2.png", 4075, 790, 1));


  drop = new ArrayList <Drop> ();

  drop.add (new Drop (this));


  tree = new ArrayList <Tree> ();
  tree.add (new Tree (this, 2000, 400));
  tree.add (new Tree (this, 4000, 400));  

  dragon = new ArrayList <Dragon> ();
  dragon.add (new Dragon (this));


  registerMethod("pre", this);

  for (Fireball f : fireballs)
  {
    f.invisible();
  }
  for (Background b : background)
  {
    b.invisible();
  }
  for (Platform p : platforms)
  {
    p.invisible();
  }
  spyro.invisible();
}


/*
Drawing is done here
 */
void draw()
{
  if (gameState == State.GAME)
  {
    logo.setVisible(false);
    logo2.setVisible(false);
    ng.setVisible(false);
    hs.setVisible(false);
    control.setVisible(false);
    backgroundPicture.setVisible (true);
    spyro.visible();
    for (Platform p : platforms)
    {
      p.visible();
    }
    background(255);
    backgroundPicture.setXY(x, 400);
    for (int i = 0; i < e.size(); i++)
    {
      e.get(i).show();
    }
  }
  for (Fireball f : fireballs)
  {
    f.getSprite().getX();
  }
  S4P.drawSprites();
   


  fill(0);
  textSize (72);
  text ("Score", width/2 - 200, 100, 3);
  text (score, width/2, 100, 1);
  if (heartCounter == 3)
  {
    image (heart1, 900, 50, 100, 100);
    image (heart2, 1000, 50, 100, 100);
    image (heart3, 1100, 50, 100, 100);
  }
  if (heartCounter == 2)
  {
    image (heart1, 900, 50, 100, 100);
    image (heart2, 1000, 50, 100, 100);
  }
  if (heartCounter == 1)
  {
    image (heart1, 900, 50, 100, 100);
  }
  if (heartCounter == 0)
  {
    gameState = State.GAMEOVER;
  }
  if (gameState == State.GAMEOVER) {
    background (0);
    fill (255);
    text ("GAME OVER", width/2 - 200, height/2);
    text ("Final Score", width/2 - 200, height/2 + 200);
    text (score, width/2 -100, height/2+ 300);
    
  }
  for (Fireball f : fireballs)
  {

    if (f.getSprite().getX() > spyro.getSprite().getX() + 600 || f.getSprite().getX() < spyro.getSprite().getX() - 600)
    {
      f.invisible();
      f.getSprite().setXY(spyro.getSprite().getX(), spyro.getSprite().getY());
      fireReady = true;
    }
  }


  if (gameState == State.BONUS)
  {
    gameoversw ++;
    println(gameoversw);
    for (Background b : background)
    {
      b.getSprite().setVelX(-70);
    }
    for (Egg e : egg)
    {
      e.getSprite().setX(e.getSprite().getX () - 10);
      if (e.getSprite().getX() < spyro.getSprite().getX() + 500)
      {
        e.flyingEggs();
      }
      e.flyingEggs();
    }
    for (Bird b : bird)
    {
      b.flyLeft();
      b.getSprite().setX(b.getSprite().getX () - 10);
    }
    for (Chick c : chick)
    {
      c.flyLeft();
      c.getSprite().setX(c.getSprite().getX () - 10);
    }
    for (Gem g : gems)
    {
      g.getSprite().setX(g.getSprite().getX () - 10);
    }
  }

  if (gameoversw > 500)
   {
     gameState = State.WIN;
   }
   
   if (gameState == State.WIN)
   {
    background (0);
    fill (255);
    text ("YOU WIN!", width/2 - 200, height/2);
    text ("Final Score", width/2 - 200, height/2 + 200);
    text (score, width/2 -100, height/2+ 300);
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
        for (Fireball f : fireballs)
        {
          f.getSprite().setX(f.getSprite().getX () - 10);
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
        for (Tree t : tree)
        {
          t.getSprite().setX(t.getSprite().getX () - 10);
        }
        for (Dragon d : dragon)
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
        for (Fireball f : fireballs)
        {
          f.getSprite().setX(f.getSprite().getX () + 10);
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
        for (Tree t : tree)
        {
          t.getSprite().setX(t.getSprite().getX () + 10);
        }
        for (Dragon d : dragon)
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


        break;
      }
    case ' ':
      {
        if (fireReady)
        {
          for (Fireball f : fireballs)
          {
            f.visible();
          }
          if (left == true)
          {
            for (Fireball f : fireballs)
            {
              f.getSprite().getX();
              f.fireLeft ();
            }
          }
          if (left == false)
          {
            for (Fireball f : fireballs)
            {
              f.getSprite().getX();
              f.fireRight();
            }
          }
          fireReady = false;
        }

        break;
      }
    }
  }
  if (gameState == State.BONUS)
  {
    switch(keyCode)
    {
    case UP:
      {
        spyro.flyUp (); 
        break;
      }
    case DOWN:
      {
        spyro.flyDown ();
        break;
      }
    }
  }
  if (gameState == State.BONUS)
  {
    switch(keyCode)
    {
    case UP:
      {
        spyro.flyUp();
        break;
      }

    case DOWN:
      {
        spyro.flyDown();

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

  if (keyCode == UP  && gameState == State.BONUS)
  {
    spyro.stopMovingUp();
  }
  if (keyCode == DOWN  && gameState == State.BONUS)
  {
    spyro.stopMovingDown();
  }
  if (keyCode == UP && gameState == State.BONUS)
  {
    spyro.stopMovingUp ();
  }
  if (keyCode == DOWN && gameState == State.BONUS)
  {
    spyro.stopMovingDown ();
  }
}

void processCollisions()
{

  //If Spyro is in contact with an enemy, have both characters move back and lose hearts
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
          heartCounter -= 1;
        }
        if (left == true ) 
        {
          i.getSprite().setX(i.getSprite().getX() - 50);
          p.getSprite().setX(p.getSprite().getX () - 50);
          x -= 50;
          heartCounter -= 1;
        }
      }
    }
  }

  for (Bird b : bird)
  {
    if (b.getSprite().pp_collision(spyro.getSprite()))
    {
      spyro.getSprite().setY(spyro.getSprite().getX() + 100);
      heartCounter -= 1;
    }
  }

  for (Chick c : chick)
  {
    if (c.getSprite().pp_collision(spyro.getSprite()))
    {
      spyro.getSprite().setY(spyro.getSprite().getX() + 100);
      heartCounter -= 1;
    }
  }




  // If Enemy is in contact with a fireball, have enemy and fire disappear and increase score
  for (Fireball f : fireballs)
  {
    for (Enemy i : e) 
    {
      if (f.getSprite().pp_collision(i.getSprite()))
      {
        i.getSprite().setVisible(false);
        f.getSprite().setVisible(false);
        f.getSprite().setXY(spyro.getSprite().getX(), spyro.getSprite().getY());
        remove.add(e.indexOf(i));
        score += 200;
        fireReady = true;
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

  // if spyro is in contact with a platform, have him stop falling

  if (gameState == State.GAME)
  {
    // if spyro is in contact with a platform, have him stop falling
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
  }

  // if spyro is in contact with the dragon continue to the Bonus game
  for (Dragon d : dragon)
  {
    if (d.getSprite().pp_collision(spyro.getSprite()))
    {
      gameState = State.BONUS;
      backgroundPicture.setVisible(false);
      d.invisible();
      for (Background b : background)
      {
        b.visible();
      }
      for (Platform p : platforms)
      {
        p.invisible();
      }
    }
  }

  //if sptro is in contact with the hole have him fall

  for (Drop d : drop)
  {
    if  (d.getSprite().bb_collision(spyro.getSprite()))
    {
      spyro.getSprite().setVelY (100);
    }
  }

  onSomething = false;
}

void mousePressed ()
{
  gameState = State.GAME;
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