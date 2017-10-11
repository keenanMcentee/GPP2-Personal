class Player
{
  PVector m_position;
  PVector m_size;
  float m_speed;
  float[] rgb = new float[3];
  Player(PVector m_groundPosition)
  {
    m_speed = 5;
    m_size = new PVector(20,60);
    m_position = new PVector(20, m_groundPosition.y - m_size.y);
  }
  void Update(PVector goalPosition, PVector goalSize)
  {
    HandleMovement(); 
    checkIfInGoal(goalPosition,goalSize);
  }
 void Display()
 {
   fill(rgb[0],rgb[1],rgb[2]);
   rect(m_position.x, m_position.y, m_size.x, m_size.y);
 }
 void HandleMovement()
 {
   if (keyPressed)
      {
        if (key == CODED)
        {
          if (keyCode == RIGHT)
          {
            MoveRight();
          }
          else if (keyCode == LEFT)
          {
           MoveLeft();
          }
        }
      }
 }
 void checkIfInGoal(PVector goalPosition, PVector goalSize)
 {
  if ((m_position.x < goalPosition.x + goalSize.x && 
       m_position.x + m_size.x >  goalPosition.x && 
       m_position.y < goalPosition.y + goalSize.y && 
       m_position.y + m_size.y > goalPosition.y))
  {
    setColor(255,255,255);
  }
  else
  {
    setColor(255,0,0);
  }
 }
 void setColor(float r, float g, float b)
 {
    rgb[0] = r;
    rgb[1] = g;
    rgb[2] = b;
 }
 void MoveLeft()
 {
   m_position.x -= m_speed;
 }
 void MoveRight()
 {
   m_position.x += m_speed;
 }
}