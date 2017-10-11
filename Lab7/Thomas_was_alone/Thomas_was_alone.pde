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
}

void Display()
{
  background(0);
  level.Display();
  player.Display();
}