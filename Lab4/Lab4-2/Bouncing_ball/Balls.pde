import java.util.*;


class Ball{
  public PVector location;
  public PVector velocity;
  color m_color = color(255,255,255);
  public int timer;
  float speed;
  public float radius = 24;
  Random generator;
  Ball()
  {
    timer = millis();
    generator = new Random();
    location = new PVector(100,100);
    velocity = new PVector(generator.nextFloat() * 100000, generator.nextFloat() * 100000);
    stroke(0);
    strokeWeight(2);
    speed = 1;
  }
  
  void update()
  {
    velocity.mult(speed);
    location.add(velocity);
    checkCollision();
    if ((timer + 1000) < millis())
    {
      m_color = color(255,255,255);
    }

  }
  
  void display()
  {
    fill(m_color);
    ellipse(location.x,location.y,radius * 2, radius * 2);
  }
  
  void checkCollision()
  {
    if (location.x < (0 + radius))
    {
      velocity.set(velocity.x * -1, velocity.y); 
      location.set(0 + radius,location.y);
    }
    else if (location.y < (0 + radius))
    {
      velocity.set(velocity.x , velocity.y* -1); 
      location.set(location.x,0+ radius);
    }
    else if (location.x > (800-radius))
    {
      velocity.set(velocity.x * -1, velocity.y); 
      location.set(800-radius,location.y);
    }
    else if (location.y > (800-radius))
    {
      velocity.set(velocity.x, velocity.y * -1); 
      location.set(location.x,800-radius);
    }
    
  }
  void collideWithBall(Ball ball)
  {
    float distanceX = ball.location.x - this.location.x;
    float distanceY = ball.location.y - this.location.y;
    float radiusSum = ball.radius + this.radius;
    if (distanceX * distanceX + distanceY * distanceY <= radiusSum * radiusSum)
    {
      ball.timer = millis();
      this.timer = millis();
      this.m_color = color(255,0,0);
      ball.m_color = color(255,0,0);
      
      
      
    }
    
  }
  
  
}