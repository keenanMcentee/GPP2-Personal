Level level;
void setup()
{
  size(800,600);
  level = new Level(width,height);
}

void draw()
{
  background(0);
  level.Display();
}