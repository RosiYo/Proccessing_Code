class Chasis {

  Body body;
  Vec2[] vertices;

  Chasis(PVector pos) {
    vertices = new Vec2[8];
      vertices[0] = Box2D.vectorPixelsToWorld(20, 10);
      vertices[1] = Box2D.vectorPixelsToWorld(20, 0);
      vertices[2] = Box2D.vectorPixelsToWorld(10, 0);
      vertices[3] = Box2D.vectorPixelsToWorld(10, -10);
      vertices[4] = Box2D.vectorPixelsToWorld(-10, -10);
      vertices[5] = Box2D.vectorPixelsToWorld(-10, 0);
      vertices[6] = Box2D.vectorPixelsToWorld(-20, 0);
      vertices[7] = Box2D.vectorPixelsToWorld(-20, 10);
      
    makeBody(pos);
  }

  void display(PImage ChasisImage){
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      imageMode(CENTER);
      image(ChasisImage, 0, 0);
    popMatrix();
  }

  void makeBody(PVector pos) {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(Box2D.coordPixelsToWorld(pos.x, pos.y));

    body = Box2D.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);

    body.createFixture(ps, 1);
  }
}
