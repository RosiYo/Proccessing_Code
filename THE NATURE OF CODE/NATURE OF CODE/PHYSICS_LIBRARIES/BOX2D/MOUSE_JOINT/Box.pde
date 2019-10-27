class Box {

  Body body;
  float w, h;
  float x, y;

  Box(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    makeBody(x, y);
  }

  void display() {
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      rectMode(CENTER);
      fill(100, 100, 200);
      strokeWeight(0.5);
      rect(0, 0, w, h);
    popMatrix();
  }
  
  void makeBody(float x, float y){
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(Box2D.coordPixelsToWorld(x, y));

    body = Box2D.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float RealW = Box2D.scalarPixelsToWorld(w/2);
    float RealH = Box2D.scalarPixelsToWorld(h/2);
    ps.setAsBox(RealW, RealH);

    body.createFixture(ps, 1);
  }
  
  boolean contains(float x, float y) { 
    //When we are working with Box2D
    Vec2 worldPoint = Box2D.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
}
