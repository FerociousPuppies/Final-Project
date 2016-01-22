import sprites.*;
import sprites.maths.*;
import sprites.utils.*;



class Drop
{
  Sprite sprite;
   Drop (PApplet app)
   {
     sprite = new Sprite (app, "brownBlock.jpg", 2);
     sprite.setXY (1575,1000);
     
     
   }
  
  Sprite getSprite()
  {
   return sprite; 
  }
  
  
  
}