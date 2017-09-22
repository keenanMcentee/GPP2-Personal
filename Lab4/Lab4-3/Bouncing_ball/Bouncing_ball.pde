//Multiple bouncing balls
final int NUM_OF_BALLS = 5;
Random generator;
Ball[] balls = new Ball[NUM_OF_BALLS];
void setup()
{
   size(800,800);
  smooth();
  generator = new Random();
  for (int i = 0; i < NUM_OF_BALLS ; i++)
  {
    balls[i] = new Ball(generator);
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < NUM_OF_BALLS ; i++)
  {
    balls[i].update();
    
    for(int j = i+1; j < NUM_OF_BALLS ; j++)
    {
      balls[i].collideWithBall(balls[j]);
    }
    balls[i].display();
  }
  

}