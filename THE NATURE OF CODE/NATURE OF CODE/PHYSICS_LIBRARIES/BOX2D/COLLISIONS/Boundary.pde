class Boundary {
  
  Body body;
  float w, h;
  
  Boundary(float x, float y, float w_, float h_) {
    w = w_;
    h = h_;
    
    makeBody(x, y);    
  }
  
  void display(){
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    
    pushMatrix();
      translate(pos.x, pos.y);
      rectMode(CENTER);
      fill(0);
      rect(0, 0, w, h);
    popMatrix();    
  }
  
  void makeBody(float x, float y){
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(Box2D.coordPixelsToWorld(x, y));

    body = Box2D.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float RealW = Box2D.scalarPixelsToWorld(w/2);
    float RealH = Box2D.scalarPixelsToWorld(h/2);
    ps.setAsBox(RealW, RealH);

    body.createFixture(ps, 1);
    body.setUserData(this);
  }
}
