class Player
{
   Body body;
   float w;
   float h;
   boolean jump;
   float[] rgb = new float[3];
   Player(float x, float y)
   {
     w = 32;
     h = 32;
     jump = false;
     body = makeBody(box2d, new Vec2(x,y),w,h, BodyType.DYNAMIC);
   }
   PVector getPos()
   {
    return new PVector( box2d.getBodyPixelCoord(body).x, box2d.getBodyPixelCoord(body).y);
   }
   void update()
   {
     if (body.getLinearVelocity().y == 0)
     {
      jump = false; 
     }
     HandleMovement();
   }
   void MoveLeft()
   {
     body.applyForce(new Vec2(-200,0), body.getWorldCenter());
   }
   void MoveRight()
   {
     body.applyForce(new Vec2(200,0), body.getWorldCenter());
   }
   void Jump()
   {
     if (!jump)
     {
       jump = true;
       body.applyForce(new Vec2(0,9000), body.getWorldCenter()); 
     }
   }
   void checkIfInGoal(PVector goalPosition, PVector goalSize)
   {
      if ((getPos().x < goalPosition.x + goalSize.x && 
           getPos().x + w >  goalPosition.x && 
           getPos().y < goalPosition.y + goalSize.y && 
           getPos().y + h > goalPosition.y))
      {
        setColor(255,255,255);
      }
      else
      {
        setColor(255,0,0);
      }
   }
   void setColor(float r, float g, float b)
   {
      rgb[0] = r;
      rgb[1] = g;
      rgb[2] = b;
   }
   void display()
   {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-angle);
    fill(rgb[0],rgb[1],rgb[2]);
    stroke(255,0,0);
    rect(0,0,w,h);
    popMatrix();
   }  
   void HandleMovement()
   {
     if (keyPressed)
      {
        if (key == CODED)
        {
          if (keyCode == RIGHT)
          {
            MoveRight();
          }
          else if (keyCode == LEFT)
          {
           MoveLeft();
          }
        }
        else if (key == ' ')
        {
         Jump(); 
        }
      }
   }
}