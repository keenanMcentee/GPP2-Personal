Level level;
Player player;
void setup()
{
  size(800,600);
  level = new Level(width,height);
  player = new Player(level.getGroundPosition());
}

void draw()
{
  Update();
  Display();
}

void Update()
{
  player.Update(level.getGoal().getPosition(), level.getGoal().getSize());
  playerObstacleCollision(level.getObstacle());
}

void Display()
{
  background(0);
  level.Display();
  player.Display();
}

void playerObstacleCollision(Obstacle obstacle)
{
  if (player.collideWith(obstacle.getPosition(), obstacle.getSize()) && player.getPosition().y + player.getSize().y > obstacle.getPosition().y)
  {
    if (player.getPosition().y + player.getSize().y - 10 > obstacle.getPosition().y)
    {
      player.setPosition(new PVector(player.getPosition().x, obstacle.getPosition().y - player.getSize().y));
    }
    if (player.getPosition().x < obstacle.getPosition().x && player.getPosition().y + player.getSize().y > obstacle.getPosition().y)
    {
      player.MoveLeft();
    }
    else if (player.getPosition().x > (obstacle.getPosition().x)  && player.getPosition().y + player.getSize().y > obstacle.getPosition().y)
    {
     player.MoveRight(); 
    }
  }
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
     player.Jump(); 
    }
  }
  if (key == ' ')
  {
   player.Jump(); 
  }
}