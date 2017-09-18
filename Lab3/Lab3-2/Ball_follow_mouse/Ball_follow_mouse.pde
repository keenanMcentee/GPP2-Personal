//Name: Keenan McEntee
//Student ID: C00201892
//Ball following mouse

PVector position;
PVector velocity;
float speed;
void setup()
{
  size(800,800);
  smooth();
  stroke(0);
  strokeWeight(2);
  position = new PVector(20,20);
  velocity = new PVector(0,0);
  speed = 0.1;
}

void draw()
{
  background(255);
  velocity = new PVector(mouseX,mouseY);
  velocity.sub(position);
  velocity.mult(speed);
  position.add(velocity);
  
  
  ellipse(position.x,position.y,48,48);
}