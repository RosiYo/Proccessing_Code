class Terrain {

  ArrayList <Vec2> surface;
  float angle, aVel, xoff;

  Terrain() {
    angle = 0;
    aVel = 0.01;
    xoff = 0;
    
    surface = new ArrayList<Vec2>();

    for(int i = 0; i <= width; i++){
      surface.add(new Vec2(i, map(noise(xoff), 0, 1, 100, height-100)));
      angle += aVel;
      xoff += 0.001;
    }

    ChainShape chs = new ChainShape();
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = vertices.length - 1; i >= 0; i--) {
      vertices[i] = Box2D.coordPixelsToWorld(surface.get(i));
    }
    chs.createChain(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    Body body = Box2D.world.createBody(bd);

    body.createFixture(chs, 1);
  }
  
  void display(){
    fill(0);
    
    beginShape();
      for(Vec2 v : surface){
        vertex(v.x, v.y);
      }
      vertex(width, height);
      vertex(0, height);
    endShape(CLOSE);
  }
}
