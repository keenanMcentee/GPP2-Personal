PImage bg;
Target target = new Target();
Ball ball = new Ball();
Cannon cannon = new Cannon();

void setup()
{
  frameRate(60);
  size(800,600);
  bg = loadImage("bg.jpg");
  
}

void draw()
{
  background(0);
  image(bg,0,0);
  if (target.checkCollision(ball))
  {
     ball = new Ball();
     target = new Target();
  }
  target.Display();
  
  ball.Update(cannon.m_angle);
  if (ball.getPosition().x > 800)
  {
   ball = new Ball(); 
  }
  ball.Display();
  
  cannon.Update();
  cannon.Display();
  
  if (keyPressed)
  {
   if (key == 'R' || key == 'r')
   {
     ball = new Ball();
     target = new Target();
   }
  }
}