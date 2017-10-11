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
  if (player.collideWith(obstacle.getPosition(), obstacle.getSize()))
  {
    if (player.getPosition().x < obstacle.getPosition().x)
    {
      player.MoveLeft();
    }
    else if (player.getPosition().x > (obstacle.getPosition().x + obstacle.getSize().x))
    {
     player.MoveRight(); 
    }
  }
}