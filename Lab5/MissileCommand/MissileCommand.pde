/*
Authors: Keenan McEntee & Keith Wilson
Date Started: 22/09/2017
*/


import java.util.*;
PVector startPos;
PVector missilePos;
PVector mouseClickPos;
PVector missileVelocity;
boolean drawLine;
void setup()
{
  size(1960,1080);
  startPos = new PVector(width/2, height);
  missilePos = new PVector(startPos.x, startPos.y);
}

void draw()
{
    update();
    display();
}

void update()
{
   goToPoint(mouseClickPos, missilePos);
   debug();
}
void display()
{
    background(255);
    if (drawLine)
      line(startPos.x,startPos.y,missilePos.x,missilePos.y);
    
}
void mouseClicked()
{
  if(mouseClickPos == null)
     mouseClickPos = new PVector((int)mouseX,(int)mouseY); 
     drawLine = true;
}
void goToPoint(PVector newLoc,PVector currentLoc)
{
    if (newLoc != null)
    {
        
        if (missileVelocity == null)
        {
          missileVelocity = new PVector((sqrt(sq((newLoc.x - currentLoc.x) /100))), (sqrt(sq((newLoc.y - currentLoc.y) / 100)))); 
        }
        
        if (missileVelocity.x == 0 && missileVelocity.y == 0)
        {
           drawLine = false;
        }
        else
        {
          if (currentLoc.x < newLoc.x)
          {
            currentLoc.x += missileVelocity.x;
          }
          else if(currentLoc.x > newLoc.x)
          {
            currentLoc.x -= missileVelocity.x;
          }
          if (currentLoc.y > newLoc.y)
          {
            currentLoc.y -= missileVelocity.y; 
          }
          if (currentLoc.y < newLoc.y)
          {
            currentLoc.y += missileVelocity.y; 
          }
          if (-10 < currentLoc.x - newLoc.x && currentLoc.x - newLoc.x < 10)
          {
            currentLoc.x = floor(currentLoc.x);
            missileVelocity.x = 0;
          }
          if (-10 < currentLoc.y - newLoc.y && currentLoc.y - newLoc.y < 10)
          {
            currentLoc.y = floor(currentLoc.y);
            missileVelocity.y = 0;
          }
        }
        
    }
}

void debug()
{
    println("Start pos:" +startPos);
    println("Click pos:" +mouseClickPos);
    println("Missile pos:" + missilePos);
    println("x:"+mouseX+",y:"+mouseY);
    println("Velocity:" + missileVelocity);
    println("\n \n \n \n \n ");
}