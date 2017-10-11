class Goal
{
 PVector m_position;
 PVector m_size;
 
 Goal(PVector startPosition)
 {
   m_size = new PVector(30,60);
   m_position = new PVector(startPosition.x,startPosition.y); 
 }
 
 PVector getPosition()
 {
  return m_position; 
 }
 
 PVector getSize()
 {
  return m_size; 
 }
 
 void Display()
 {
    fill(0,0,0,0);
    stroke(255,255,255,255);
    rect(m_position.x,m_position.y, m_size.x, m_size.y); 
 }
}