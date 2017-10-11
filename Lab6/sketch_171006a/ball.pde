public PVector m_position;
PVector m_velocity;
PVector GRAVITY = new PVector(0,9.8);
float METERS_TO_PIXELS = 20; //20 pixels = 1 meter.
float initialForce = 12;
boolean launch = false;
public float radius = 15;
class Ball
{
  Ball()
  {
    m_position = new PVector(20,500);
    m_velocity = new PVector(0,0);
    launch = false;
  }
  PVector getPosition()
  {
   return m_position; 
  }
  float getRadius()
  {
   return radius; 
  }
  void Update(float angle)
  {
    if (keyPressed)
      {
        if (key == CODED)
        {
          if (keyCode == RIGHT)
          {
            if (initialForce < 30)
              initialForce += 0.5f;
              println(initialForce);
          }
          else if (keyCode == LEFT)
          {
           if (initialForce > 12)
             initialForce -= 0.5f;
             println(initialForce);
          }
        }
      }
    if (launch)
    {
      if (m_position.y > 500)
      {
       m_position.y = 500; 
       m_velocity.y = 0;
      }
      m_velocity.add(GRAVITY);
    }
    else
    {
      if (keyPressed)
      {
        if (key == ' ')
        {
          m_velocity.add(cos(-angle * PI/180) * initialForce * METERS_TO_PIXELS,sin(angle * PI/180) * -initialForce * METERS_TO_PIXELS);
          launch = true;
        }
      }
      
    }
    m_position.add(PVector.div(m_velocity,METERS_TO_PIXELS));
    
   
  }
  
  void Display()
  {
    fill(0,0,255);
    ellipse(m_position.x, m_position.y, 15,15);
    fill(0,0,0,0);
    rect(10,550,150,20);
    fill(255,0,0,255);
    rect(10,550,initialForce/30 * 150,20);
  }
}