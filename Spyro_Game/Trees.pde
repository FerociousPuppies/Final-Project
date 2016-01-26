import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

class Tree
{
  Sprite sprite;

  Tree (PApplet app, int x, int y)
  {
    sprite = new Sprite (app, "tree.png", 6);
    sprite.setScale (1.25);
    sprite.setXY (x, y);
  } 
    Sprite getSprite()
  {
   return sprite; 
  }
}