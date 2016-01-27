//import of libraries
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;
//import processing.music.*;

//stated sprites


Sprite start, backgroundPicture, over;

enum State {
  TITLE, GAME, BONUS, GAMEOVER, WIN
};
  State gameState;
StopWatch sw;
PImage bg;
Spyro spyro;
//defined variables, arraylists and booleans
int x;
ArrayList remove;
ArrayList <Gem> gems;
ArrayList <Enemy> e;
ArrayList <Fireball> fireballs;
ArrayList <Platform> platforms;
ArrayList <Drop> drop;
ArrayList <Background> background;
ArrayList <Bird> bird;
ArrayList <Chick> chick;
ArrayList <Dragon> dragon; 
ArrayList <Instructions> instructions;
int score;
boolean left;
int counter;
boolean fire = false;
boolean jump = false;
boolean fireball = false;
int timer;
int y;
boolean jumping;
int gravity;
boolean onSomething;
int heartCounter;
PImage heart1;
PImage heart2;
PImage heart3;
PImage win;
boolean currentState = false;
boolean lastState = false;
boolean showHeart = false;
boolean march = false;
int xb;
int press;
boolean fireReady = true;
int backgroundSW;
int gameoversw;
int textX;
float bx1, bx2, bx3, bx4, bx5, bx6, bx7, bx8;
float by1, by2, by3, by4, by5, by6, by7, by8;
int loc;
boolean up = true;
boolean down = true;

void setup()
{
  //game all the variables values
  size(1200, 800);
  gameState = State.TITLE;
  background (0);
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
  textX = 25;
  loc = 0;

  bx1 = random(1200, 8000);
  bx2 = random(1200, 8000);
  bx3 = random(1200, 8000);
  bx4 = random(1200, 8000);
  bx1 = random(1200, 8000);
  bx5 = random(1200, 8000);
  bx6 = random(1200, 8000);
  bx7 = random(1200, 8000);
  bx8 = random(1200, 8000);

  by1 = random(0, 800);
  by2 = random(0, 800);
  by3 = random(0, 800);
  by4 = random(0, 800);  
  by5 = random(0, 800);
  by6 = random(0, 800);
  by7 = random(0, 800);
  by8 = random(0, 800);


  //defined all sprites
  start = new Sprite(this, "Spyro Start.jpg", 1);
  start.setXY(width/2, height/2);
  start.setScale(1);


  backgroundPicture = new Sprite (this, "Artisans.png", 1);
  backgroundPicture.setVisible (false);

  over = new Sprite (this, "spyro-gameover.png", 1);
  over.setXY(width/2 + 100, height/2);
  over.setVisible(false);

  instructions = new ArrayList <Instructions> ();
  instructions.add(new Instructions (this, "Instructions.png"));



  //defined all araylists 
  background = new ArrayList <Background> ();
  background.add(new Background (this, xb, 400));



  heart1 = loadImage ("heart.png");
  heart2 = loadImage ("heart.png");
  heart3 = loadImage ("heart.png");


  e = new ArrayList <Enemy>();
  e.add(new Enemy(this, "Line 105 Tran.gif", 2200, 700, 3));
  e.add(new Enemy(this, "Line 68 Tran.gif", 2800, 700, 3));
  e.add(new Enemy(this, "Line 28 Trans.gif", 3400, 700, 3));
  e.add(new Enemy(this, "Line 66 Tran.gif", 4000, 700, 3));



  bird = new ArrayList <Bird> ();
  bird.add(new Bird (this, "Line 4 Trans.gif", bx1, by1, 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", bx2, by2, 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", bx3, by3, 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", bx4, by4, 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", bx5, by4, 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", bx6, by7, 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", bx7, by7, 3));
  bird.add(new Bird (this, "Line 4 Trans.gif", bx8, by8, 3));

  chick = new ArrayList <Chick> ();
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));
  chick.add (new Chick (this, random (1200, 8000), random (0, 800)));




  gems = new ArrayList <Gem> ();
  gems.add(new Gem (this, "RedGems.gif", 2160, 200, 3));
  gems.add(new Gem (this, "RedGems.gif", 5000, 250, 3));
  gems.add(new Gem (this, "RedGems.gif", 4600, 250, 3));
  gems.add(new Gem (this, "RedGems.gif", 4400, 300, 3));


  spyro = new Spyro(this, y);



  fireballs = new ArrayList <Fireball> ();
  fireballs.add(new Fireball (this, "fireball.png", (int) spyro.getSprite().getX(), y, 2));



  platforms = new ArrayList <Platform> ();
  platforms.add (new Platform (this, "platform1.jpg", 1580, 600, 1));
  platforms.add (new Platform (this, "platform1.jpg", 3000, 575, 1));
  platforms.add (new Platform (this, "platform1.jpg", 2700, 375, 1));
  platforms.add (new Platform (this, "platform1.jpg", 2400, 275, 1));
  platforms.add (new Platform (this, "platform1.jpg", 2280, 275, 1));
  platforms.add (new Platform (this, "platform1.jpg", 2160, 275, 1));
  platforms.add (new Platform (this, "platform1.jpg", 5000, 325, 1));
  platforms.add (new Platform (this, "platform1.jpg", 4600, 325, 1));
  platforms.add (new Platform (this, "platform1.jpg", 4280, 450, 1));
  platforms.add (new Platform (this, "platform1.jpg", 4160, 575, 1));
  platforms.add (new Platform (this, "ArtisanPlaform.jpg", 665, 790, 1));
  platforms.add (new Platform (this, "ArtisanPlatform2.png", 4175, 790, 1));


  drop = new ArrayList <Drop> ();

  drop.add (new Drop (this));


  dragon = new ArrayList <Dragon> ();
  dragon.add (new Dragon (this));


  win = loadImage("Win.jpg");


  registerMethod("pre", this);

  for (Instructions i : instructions)
  {
    i.invisible();
  }

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
  //if game state then draw the main game with platforms
  if (gameState == State.GAME)
  {
    start.setVisible(false);
    backgroundPicture.setVisible (true);
    spyro.visible();
    for (Platform p : platforms)
    {
      p.visible();
    }
    for (Instructions i : instructions)
    {
      i.visible();
    }

    background(255);
    showHeart = true;
    backgroundPicture.setXY(x, 400);
    for (int i = 0; i < e.size(); i++)
    {
      e.get(i).show();
    }
  }
  //have the fireballs get the x of spyro so that when its fired it comes froms spyro
  for (Fireball f : fireballs)
  {
    f.getSprite().getX();
  }

  //draws the sprites
  S4P.drawSprites();

  //if the enemy is in a certain distance within then spyro then have the enemies run at spyro
  for (Enemy i : e)
  {
    if (i.getSprite().getX() < spyro.getSprite().getY() + 400)
    {
      i.getSpyroToLeft();
    }

    if (i.getSprite().getX() < spyro.getSprite().getY() - 400)
    {
      i.getSpyroToRight();
    }

    if (spyro.getSprite().getY() > width - 300)
    {
      gameState = State.GAMEOVER;
    }
  }



  //score
  fill(0);
  textSize (72);
  text ("Score", width/2 - 200, 100, 3);
  text (score, width/2, 100, 1);


  //show the hearts 
  if (showHeart)
  {
    if (heartCounter == 3)
    {
      image (heart1, 950, 50, 100, 100);
      image (heart2, 1050, 50, 100, 100);
      image (heart3, 1150, 50, 100, 100);
    }
    if (heartCounter == 2)
    {
      image (heart1, 950, 50, 100, 100);
      image (heart2, 1050, 50, 100, 100);
    }
    if (heartCounter == 1)
    {
      image (heart1, 950, 50, 100, 100);
    }
    if (heartCounter == 0)
    {
      gameState = State.GAMEOVER;
    }
  }

  //game over screen
  if (gameState == State.GAMEOVER) {
    over.setVisible(true);
    fill (255);
    text ("GAME OVER", width/2 - 200, height/2);
    text ("Final Score", width/2 - 200, height/2 + 200);
    text (score, width/2 -100, height/2+ 300);
    if (mousePressed)
    {
      gameState = State.GAME;
    }
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
    for (Enemy i : e)
    {
      i.invisible();
    }
    for (Drop d : drop)
    {
      d.invisible();
    }
  }


//if the fireball gets too afr away fro spyro have it disapprear and reset at spyro
for (Fireball f : fireballs)
{
  if (f.getSprite().getX() > spyro.getSprite().getX() + 600 || f.getSprite().getX() < spyro.getSprite().getX() - 600)
  {
    f.invisible();
    f.getSprite().setXY(spyro.getSprite().getX(), spyro.getSprite().getY());
    fireReady = true;
  }
  if (fireReady == true)
  {
    f.getSprite().setXY(spyro.getSprite().getX(), spyro.getSprite().getY());
  }
}


//if bonus get rid of the platforms amd change the backgorund and gravity is not ineffect and added birds and chicks
if (gameState == State.BONUS)
{
  gameoversw ++;
  for (Background b : background)
  {
    b.getSprite().setVelX(-50);
  }
  for (Bird b : bird)
  {
    //b.visible(); 
    b.flyLeft();
    b.getSprite().setX(b.getSprite().getX () - 10);
  }

  for (Chick c : chick)
  {
    //c.visible(); 
    c.flyLeft();
    c.getSprite().setX(c.getSprite().getX () - 10);
  }
  for (Gem g : gems)
  {
    g.getSprite().setX(g.getSprite().getX () - 10);
  }
  if (spyro.getSprite().getY() - spyro.getSprite().getHeight()/2 < 0 )
  {
    up = false;
  }
  if (spyro.getSprite().getY() + spyro.getSprite().getHeight()/2 > height)
  {
    down = false;
  }
  println (up);
}

if (gameoversw > 500)
{
  gameState = State.WIN;
}

//if win then show win screen
if (gameState == State.WIN)
{
  background (0);
  fill (0, 255, 0);
  image (win, width/2, height/2);
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
  //if game these are the controls
  if (gameState == State.GAME)
  {

    switch(keyCode)
    {
    case RIGHT:
      {
        //movethe screem to the right
        spyro.moveRight ();
        loc +=1; 
        x -= 10;
        textX -= 10;
        left = false;
        //have all the elements move with the background
        for (Instructions i : instructions)
        {
          i.getSprite().setX(i.getSprite().getX () - 10);
        }

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
        for (Dragon d : dragon)
        {
          d.getSprite().setX(d.getSprite().getX () - 10);
        }
        processCollisions();
        break;
      }
    case LEFT:
      {
        //constain so spyro can't walk off the sceen
        //move the backgorund to the left
        if (loc > 0) {
          spyro.moveLeft();
          loc -= 1; 
          x += 10;
          textX += 10;
          left = true;
          //move the enemies with the background
          for (Instructions i : instructions)
          {
            i.getSprite().setX(i.getSprite().getX () + 10);
          }
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
          for (Dragon d : dragon)
          {
            d.getSprite().setX(d.getSprite().getX () + 10);
          }
          processCollisions();
        }
        break;
      }
    case UP:
      {
        //have spyro jump
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
        //if the spacebar is ppressed the fireball is set to visible and fired from spyro
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


  //if bonus these are thr controls

  if (gameState == State.BONUS)
  {
    switch(keyCode)
    {
    case UP:
      {
        //spyro flies upward 
        if (up == true)
        {
          spyro.flyUp ();
          down = true;
        }
        if (up == false)
        {
          spyro.getSprite().setVelY (0);
        }
        break;
      }
    case DOWN:
      {
        //spyro flies down
        if (down == true)
        {
          spyro.flyDown ();
          up = true;
        }
        if (down == false)
        {
          spyro.getSprite().setVelY (0);
        }
        break;
      }
    }
  }
}
void keyReleased()
{
  //if the key released spyro stops moving
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
  //if spyro and the bird collide, score decreases
  for (Bird b : bird)
  {
    if (b.getSprite().pp_collision(spyro.getSprite()))
    {
      b.getSprite().setVisible(false);
      score -= 50;
      remove.add(bird.indexOf(b));
    }
  }
  for (Object b : remove)
  {
    bird.remove(b);
  }
  remove.clear();
  //if spyro and the bird collide, score decreases
  for (Chick c : chick)
  {
    if (c.getSprite().pp_collision(spyro.getSprite()))
    {
      c.getSprite().setVisible(false);
      score -= 50;
      remove.add(chick.indexOf(c));
    }
  }
  for (Object c : remove)
  {
    chick.remove(c);
  }
  remove.clear();





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

  //if game state
  if (gameState == State.GAME)
  {
    // if spyro is in contact with a platform, have him stop falling
    for (Platform p : platforms) 
    {
      if (p.getSprite().getY() - p.getSprite().getHeight()/2 > spyro.getSprite().getY() + spyro.getSprite().getHeight()/2 - 20  )
      {

        if (p.getSprite().bb_collision(spyro.getSprite()))
        {

          spyro.getSprite().setVelY(0);
          spyro.getSprite().setY(p.getSprite().getY() - p.getSprite().getHeight()/2 - spyro.getSprite().getHeight()/2);
          jump = false;
          onSomething = true;
        }
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