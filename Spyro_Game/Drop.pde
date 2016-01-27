import sprites.*;
import sprites.maths.*;
import sprites.utils.*;



class Drop
{
  Sprite sprite;
   Drop (PApplet app)
   {
     sprite = new Sprite (app, "brownBlock.jpg", 2);
     sprite.setXY (1630,1000);
     
     
   }
  //be able to get the sprite's location and scale and velocity
  Sprite getSprite()
  {
   return sprite; 
  }
  
  
  
}