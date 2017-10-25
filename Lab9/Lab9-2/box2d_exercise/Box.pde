/*KEENAN MCENTEE*/

// A rectangular box
class Box  {
  Body body;
  BodyDef bd;
  Vec2 center;
  float x,y;
  float w,h;

  // Constructor
  Box(float x_, float y_) {
    x = x_;
    y = y_;
    w = 16;
    h = 16;
    
    bd = new BodyDef();
    center = box2d.coordPixelsToWorld(x,y);
    bd.position.set(center);
    bd.type = BodyType.DYNAMIC;
    
    body= box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    body.createFixture(fd);
  }

  // Drawing the box
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
}