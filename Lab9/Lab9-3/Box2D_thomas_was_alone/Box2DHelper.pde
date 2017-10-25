public static Body makeBody(Box2DProcessing box2d, Vec2 center, float w_, float h_, BodyType _type)
   {
     Body body;
     PolygonShape sd = makeBox(box2d,w_,h_);   
     FixtureDef fd = makeFixture(sd,1,0.4,0.1);
     BodyDef bd = makeBodyDef(box2d,_type , center);
     body = box2d.createBody(bd);
     body.createFixture(fd);
     
     return body;
   }
   public static PolygonShape makeBox(Box2DProcessing box2d,float _width, float _height)
   {
     PolygonShape sd = new PolygonShape();
     float box2dW = box2d.scalarPixelsToWorld(_width/2);
     float box2dH = box2d.scalarPixelsToWorld(_height/2);
     sd.setAsBox(box2dW,box2dH);
     return sd;
   }
   
   public static FixtureDef makeFixture(PolygonShape sd, float density, float friction, float restitution)
   {
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = density;
    fd.friction = friction;
    fd.restitution = restitution;
    return fd;
   }
   
   public static BodyDef makeBodyDef(Box2DProcessing box2d,BodyType _type, Vec2 _center)
   {
    BodyDef bd = new BodyDef();
    bd.type = _type;
    bd.position.set(box2d.coordPixelsToWorld(_center));
    
    return bd;
   }