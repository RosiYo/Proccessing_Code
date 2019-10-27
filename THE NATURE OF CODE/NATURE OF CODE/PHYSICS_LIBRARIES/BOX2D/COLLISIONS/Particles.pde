class Particle {
  
  float w, h;
  Body body;
  color c;

  Particle(float x, float y, float w_, float h_) {
    w = w_;
    h = h_;

    makeBody(x, y);
    body.setUserData(this);
    c = color(200);    
  }

  void display() {
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      fill(c);
      rect(0, 0, w, h);
    popMatrix();
  }

  void makeBody(float x, float y) {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(Box2D.coordPixelsToWorld(x, y));

    body = Box2D.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float psWidth = Box2D.scalarPixelsToWorld(w/2);
    float psHeight = Box2D.scalarPixelsToWorld(h/2);
    ps.setAsBox(psWidth, psHeight);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;

    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.1;

    body.createFixture(fd);
  }

  boolean checkEdges() {
    Vec2 pos = Box2D.getBodyPixelCoord(body);

    if (pos.y > height) /* => */ return true;
    else /* => */ return false;
  } 
  
  void change(){
    c = color(100); 
  }  
  
  void destroy(){
    Box2D.destroyBody(body); 
  }
}
