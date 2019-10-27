import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

ArrayList <Box> b;
Terrain t;
Plataform p;

Box2DProcessing Box2D;

void setup() {
  size(600, 600);
  
  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();
  
  b = new ArrayList <Box>();
  p = new Plataform(width/2, 200, 100, 20);
  t = new Terrain();
}

void draw() {
  background(255);
  
  Box2D.step();
  
  p.display();
  t.display();
  
  for (Box b_ : b) {
    b_.display();
  }
}

void mouseDragged() {
  b.add(new Box(mouseX, mouseY, 16, 16));
}
