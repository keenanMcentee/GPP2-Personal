//Multiple bouncing balls
Ball[] balls = new Ball[20];
void setup()
{
   size(800,800);
  smooth();
  for (int i = 0; i < 20; i++)
  {
    balls[i] = new Ball();
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < 20; i++)
  {
    balls[i].update();
    balls[i].display();
  }
}