/*
@Author: Keenan McEntee
@Subject: Gameplay Programming
@Summary: Main Class for running our simulation of multiple balls colliding.
*/


final int NUM_OF_BALLS = 20;  //Const number of balls. Increase this to add more balls to the simulation.
Random generator;
Ball[] balls = new Ball[NUM_OF_BALLS];
void setup()
{
  size(800,800);    //Sets the window width and heigth
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
    
    for(int j = i + 1; j < NUM_OF_BALLS ; j++)
    {
      balls[i].collideWithBall(balls[j]);
    }
    balls[i].display();
  }
  

}