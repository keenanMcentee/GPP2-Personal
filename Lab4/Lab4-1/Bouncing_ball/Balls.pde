import java.util.*;


class Ball{
  PVector location;
  PVector velocity;
  float speed;
  Random generator;
  Ball()
  {
    generator = new Random();
    location = new PVector(100,100);
    velocity = new PVector(generator.nextFloat() * 10, generator.nextFloat() * 10);
    stroke(0);
    strokeWeight(2);
    speed = 1;
  }
  
  void update()
  {
    velocity.mult(speed);
    location.add(velocity);
    checkCollision();
  }
  
  void display()
  {
    ellipse(location.x,location.y,48,48);
  }
  
  void checkCollision()
  {
    if (location.x < (0 + 24))
    {
      velocity.set(velocity.x * -1, velocity.y); 
    }
    else if (location.y < (0 + 24))
    {
      velocity.set(velocity.x , velocity.y* -1); 
    }
    else if (location.x > (800-24))
    {
      velocity.set(velocity.x * -1, velocity.y); 
    }
    else if (location.y > (800-24))
    {
      velocity.set(velocity.x, velocity.y * -1); 
    }
    
  }
}