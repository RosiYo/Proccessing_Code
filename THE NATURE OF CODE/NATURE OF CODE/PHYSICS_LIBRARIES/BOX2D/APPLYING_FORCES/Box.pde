class Box {

  Body body;
  float w, h;

  Box(float x, float y, float w_, float h_) {
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
      noStroke();
      fill(100, 200, 100);
      rect(0, 0, w, h);
    popMatrix();
  }

  void makeBody(float x, float y) {
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
  
  boolean destroy(){
    Vec2 pos = Box2D.getBodyPixelCoord(body); 
    
    if(pos.x > width) /* => */ return true;
    else /* => */ return false;
  }
  
  void applyForce(Vec2 force){
    Vec2 FPoint = body.getWorldCenter();
    body.applyForce(force ,FPoint); 
  }
}
