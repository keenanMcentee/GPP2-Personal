class Obstacle
{
 PVector m_position;
 PVector m_size;
 Obstacle(int x,int y,int wid,int hei)
 {
   m_position = new PVector(x,y);
   m_size = new PVector(wid,hei);
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
   fill(50,50,50);
   stroke(0,0,0,0);
   rect(m_position.x,m_position.y,m_size.x,m_size.y);
 }
}