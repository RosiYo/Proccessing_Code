class Hat1 {

  Body body;
  PImage bottom, top;

  Hat1(float x, float y, PImage Hat1_bottom, PImage Hat1_top) {
    makeBody(x, y);
    
    bottom = Hat1_bottom;
    top = Hat1_top;
  }

  void display() {
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      fill(200);
      
      image(bottom, 0, -4); 
      
      imageMode(CENTER);
      image(top, 0, -20);
      
    popMatrix();
  }
  
  void makeBody(float x, float y){
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(Box2D.coordPixelsToWorld(x, y));

    body = Box2D.createBody(bd);

    PolygonShape tri = new PolygonShape();

    Vec2[] triangle = new Vec2[3];
    triangle[0] = Box2D.vectorPixelsToWorld(0, -20);
    triangle[1] = Box2D.vectorPixelsToWorld(10, 10);
    triangle[2] = Box2D.vectorPixelsToWorld(-10, 10);

    tri.set(triangle, triangle.length);

    CircleShape cs = new CircleShape();
    cs.m_radius = Box2D.scalarPixelsToWorld(10/2);
    
    Vec2 offset = new Vec2(0, -20);
    offset = Box2D.vectorPixelsToWorld(offset);
    cs.m_p.set(offset.x, offset.y);

    body.createFixture(tri, 1);
    body.createFixture(cs, 1);
    
    float random = random(-5, 5);
    body.setLinearVelocity(new Vec2(random, random(2, 5)));
    body.setAngularVelocity(random);
  }
  
  void killBody(){
   Box2D.destroyBody(body);
  }
  
  boolean done() {
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    
    if(pos.y > height){
      killBody();
      return true;
    }else{
      return false;
    }
  }
}
