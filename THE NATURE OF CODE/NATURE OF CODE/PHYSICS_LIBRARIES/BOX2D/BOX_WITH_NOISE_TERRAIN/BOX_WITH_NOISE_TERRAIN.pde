import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

ArrayList <Box> b;
Terrain t;

Box2DProcessing Box2D;

void setup() {
  size(600, 600);
  b = new ArrayList <Box>();
  
  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();
  t = new Terrain();
}

void draw() {
  background(255);
  
  Box2D.step();
  
  t.display();
  
  for (Box b_ : b) {
    b_.display();
  }
}

void mouseDragged() {
  b.add(new Box(mouseX, mouseY, 16, 16));
}
