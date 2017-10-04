import java.util.*;
/*
@Author: Keenan McEntee
@Subject: Gameplay Programming
@Class Summary: Ball object for our bouncing balls simulations.
*/

class Ball{
  public PVector location;
  public PVector velocity;
  color m_color = color(255,255,255);
  public int timer;
  float speed;
  public float radius = 0;
  Ball(Random generator)
  {
    timer = millis();
    location = new PVector(100,100);
    velocity = new PVector(generator.nextFloat() * 10, generator.nextFloat() * 10);
    stroke(0);
    strokeWeight(2);
    radius = generator.nextFloat() * 20 + 5;
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
  boolean collideWithBall(Ball ball)
  {
    float distanceX = ball.location.x - this.location.x;
    float distanceY = ball.location.y - this.location.y;
    float radiusSum = ball.radius + this.radius;
    if (distanceX * distanceX + distanceY * distanceY <= radiusSum * radiusSum && millis() > 3000)
    {
      ball.timer = millis();
      this.timer = millis();
      this.m_color = color(255,0,0);
      ball.m_color = color(255,0,0);
      elasticCollision(ball);
      return true;
      
    }
    else
    {
     return false; 
    }
  }
  
  void elasticCollision(Ball ball)
  {
      
     PVector v1;
     PVector v2;
     PVector u1 = new PVector(ball.velocity.x, ball.velocity.y);
     PVector u2 = new PVector(this.velocity.x, this.velocity.y);
     float m1 = ball.radius;
     float m2 = this.radius;
     
     v1 = PVector.div(PVector.add(PVector.mult(u1,(m1-m2)), PVector.mult(u2,(2*m2))), (m1 + m2));
     v2 = PVector.div(PVector.add(PVector.mult(u2,(m2 - m1)), PVector.mult(u1,(2*m1))), (m1 + m2));
     
     ball.velocity = v1;
     this.velocity = v2;
     
  }
  
}