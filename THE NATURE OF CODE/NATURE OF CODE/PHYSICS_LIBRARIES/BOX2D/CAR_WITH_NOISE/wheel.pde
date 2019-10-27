class Wheel {

  Body body;
  float WheelsSize;

  Wheel(PVector pos, float WheelsSize_) {
    WheelsSize = WheelsSize_;    
    makeBody(pos);
  }

  void display(PImage WheelImage) {
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
      translate(pos.x, pos.y + 4);
      rotate(-a);
      imageMode(CENTER);
      image(WheelImage, 0, 0, WheelsSize, WheelsSize);
    popMatrix();
  }

  void makeBody(PVector pos) {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(Box2D.coordPixelsToWorld(pos.x, pos.y));

    body = Box2D.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = Box2D.scalarPixelsToWorld(WheelsSize);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
    fd.density = 1;
    fd.friction = 1.5;
    fd.restitution = 0.1;
    
    body.createFixture(fd);
  }
}
