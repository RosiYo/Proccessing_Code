class Box {
  float w, h;

  Body body;

  Box(float x, float y, float w_, float h_) {
    w = w_;
    h = h_;

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
    fd.restitution = 0.5;
    
    body.createFixture(fd);
  }

  void display() {
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      fill(200);
      rect(0, 0, w, h);
    popMatrix();
  }
}
