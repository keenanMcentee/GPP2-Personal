//Name: Keenan McEntee
//Student ID: C00201892
//Ball following mouse

import java.util.*;
Random generator;

PVector position;
PVector velocity;
float acceleration;
void setup()
{
  size(800,800);
  smooth();
  stroke(0);
  strokeWeight(2);
  generator = new Random();
  position = new PVector(20,20);
  velocity = new PVector(0,0);
}

void draw()
{
  background(255);
  velocity = new PVector(mouseX,mouseY);
  velocity.sub(position);
  acceleration = generator.nextFloat() / 10;
  velocity.mult(acceleration);
  position.add(velocity);
  
  
  ellipse(position.x,position.y,48,48);
}