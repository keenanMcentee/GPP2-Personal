class Player
{
  PVector m_position;
  PVector m_size;
  PVector m_velocity;
  float m_speed;
  float[] rgb = new float[3];
  float jumpForce;
  float groundHeight;
  final PVector GRAVITY = new PVector(0,9.8);
  boolean jumped;
  Player(PVector m_groundPosition)
  {
    m_speed = 5;
    m_size = new PVector(20,60);
    m_position = new PVector(20, m_groundPosition.y - m_size.y);
    groundHeight = m_groundPosition.y - m_size.y;
    jumped = false;
    jumpForce = -50;
    m_velocity = new PVector(0,0);
  }
  void Update(PVector pos, PVector size)
  {
    HandleMovement(); 
    checkIfInGoal(pos,size);
    m_position.add(m_velocity); 
    handleFalling();
  }
  PVector getPosition()
  {
   return m_position; 
  }
  void setPosition(PVector pos)
  {
    m_position = pos;
  }
  PVector getSize()
  {
   return m_size; 
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
 void Display()
 {
   fill(rgb[0],rgb[1],rgb[2]);
   rect(m_position.x, m_position.y, m_size.x, m_size.y);
 }
 void checkIfInGoal(PVector pos, PVector size)
 {
  if (collideWith(pos,size))
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
 
 boolean collideWith(PVector pos, PVector size)
 {
   if ((m_position.x < pos.x + size.x && 
       m_position.x + m_size.x >  pos.x && 
       m_position.y < pos.y + size.y && 
       m_position.y + m_size.y > pos.y))
  {
    return true;
  }
  else
  {
   return false; 
  }
 }
 void Jump()
 {
   if (!jumped)
   {
     jumped = true;
     m_velocity.y = jumpForce;
   }
 }
 void handleFalling()
 {
  if (m_position.y > groundHeight) 
  {
   m_position.y = groundHeight;
   jumped = false;
  }
  else if (jumped == true)
  {
    m_velocity.add(GRAVITY);
  }
 }
}