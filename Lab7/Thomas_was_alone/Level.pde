class Level
{
  PVector screenSize;
  PVector groundPosition;
  Level(int m_width,int m_height)
  {
    screenSize = new PVector(m_width,m_height);
    groundPosition = new PVector(0,400);
  }
  void Display()
  {
    drawGround();
    drawGoal();
  }
  void drawGround()
  {
    fill(50,50,50,255);
    stroke(0,0,0,0);
    rect(groundPosition.x,groundPosition.y,screenSize.x,screenSize.y);
  }
  void drawGoal()
  {
    fill(0,0,0,0);
    stroke(255,255,255,255);
    rect(screenSize.x - 50,groundPosition.y - 60, 30,60);
  }
}