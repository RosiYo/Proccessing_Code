class Limit {
  Body body;

  Limit() {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(Box2D.coordPixelsToWorld(width/2, height-10));

    body = Box2D.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.setAsBox(Box2D.scalarPixelsToWorld(width/2), Box2D.scalarPixelsToWorld(10));

    body.createFixture(ps, 1);
  }
  void display() {
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    
    pushMatrix();
      translate(pos.x, pos.y);
      rect(-width/2, -10, width, 20);
    popMatrix();
  }
}
