class StaticObject
{
   Body body;
   float w;
   float h;
   StaticObject(float x, float y, float _w,float _h)
   {
     w = _w;
     h = _h;
     body = makeBody(box2d, new Vec2(x,y),w,h, BodyType.STATIC);
   }
   void update()
   {
     
   }
   void display()
   {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-angle);
    fill(175);
    stroke(175);
    rect(0,0,w,h);
    popMatrix();
   }  
}