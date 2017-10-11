class Cannon
{
  PVector m_position;
  PVector m_size;
  public float m_angle;
  Cannon()
  {
    m_angle = 0;
    m_position = new PVector(20,500);
    m_size = new PVector(100,30);
  }
  void Update()
  {
    if (keyPressed)
      {
        if (key == CODED)
        {
          if (keyCode == UP)
          {
            if (m_angle < 90)
              m_angle++;
          }
          else if (keyCode == DOWN)
          {
           if (m_angle > 0)
             m_angle--;
          }
        }
      }
  }
  void Display()
  {
    
    translate(m_position.x, m_position.y);
    rotate(PI/180 * (m_angle * -1));
    fill(255,0,0);
    ellipse(0,0,10,10);
    fill(0,255,0);
    rect(0,-m_size.y/2,m_size.x, m_size.y, 45, 0, 0, 45);
  }
}