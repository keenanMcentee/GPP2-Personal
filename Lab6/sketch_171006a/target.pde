import java.util.*;
class Target
{
   Random rng = new Random();
   PVector position;
   Target()
   {
     position = new PVector(rng.nextInt(700 - 300) + 300, rng.nextInt(500 - 50) + 50);
   }
   void Display()
   {
     fill(255,0,0);
     ellipse(position.x, position.y, 100,100);
   }
   boolean checkCollision(Ball b)
   {
     if (PVector.sub(b.getPosition(), position).mag() < b.getRadius() + radius + 15)
     {
       println(true);
        return true;
     }
     else
     {
       println(false);
      return false; 
     }
   }
}