class Level
{
  PVector screenSize;
  PVector groundPosition;
  Goal goal;
  Level(int m_width,int m_height)
  {
    screenSize = new PVector(m_width,m_height);
    groundPosition = new PVector(0,400);
    goal = new Goal(new PVector(screenSize.x - 50, groundPosition.y - 60));
  }
  Goal getGoal()
  {
   return goal; 
  }
  PVector getGroundPosition()
  {
   return groundPosition; 
  }
  void Display()
  {
    drawGround();
    goal.Display();
  }
  
  void drawGround()
  {
    fill(50,50,50,255);
    stroke(0,0,0,0);
    rect(groundPosition.x,groundPosition.y,screenSize.x,screenSize.y);
  }
}