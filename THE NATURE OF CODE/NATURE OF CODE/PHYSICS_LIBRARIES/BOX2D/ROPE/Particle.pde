class BridgeSegment {
  Body body;

  float pixelW, pixelH, y;
  PVector posV;

  BridgeSegment(float x, float y_, float w, float h, boolean st) {
    pixelW = w;
    pixelH = h;
    y = y_;
    
    posV = new PVector(x, y_);
    Vec2 pos = new Vec2(Box2D.coordPixelsToWorld(posV.x, posV.y));
    float realW = Box2D.scalarPixelsToWorld(w/2);
    float realH = Box2D.scalarPixelsToWorld(h/2);

    makeBody(pos, realW, realH, st);
  }

  void display() {
    Vec2 pos = Box2D.getBodyPixelCoord(body);

    pushMatrix();
      translate(pos.x, pos.y);
      fill(200);
      rectMode(CENTER);
      rect(0, 0, pixelW, pixelH);
    popMatrix();
  }

  void makeBody(Vec2 pos, float realW, float realH, boolean st) {
    BodyDef bd = new BodyDef();

    if (st) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;

    bd.position.set(pos);

    body = Box2D.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.setAsBox(realW, realH);

    body.createFixture(ps, 1);
  }
}
