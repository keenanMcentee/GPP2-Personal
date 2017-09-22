//Multiple bouncing balls
Ball ball;
void setup()
{
   size(800,800);
  smooth();
  ball = new Ball();
}

void draw()
{
  background(255);
    ball.update();
    ball.display();
}