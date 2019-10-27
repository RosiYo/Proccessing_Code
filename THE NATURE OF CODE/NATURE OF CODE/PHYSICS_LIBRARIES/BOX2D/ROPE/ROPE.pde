import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing Box2D;
Bridge b;
ArrayList <Box> object;

int scl = 4;

void setup() {
  size(600, 600);
  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();
  b = new Bridge(width, width/scl, height/4);
  object = new ArrayList <Box>();
}

void draw() {
  background(255);

  Box2D.step();
  b.display();
  
  for (Box o : object) {
    o.display();
  }
}

void mousePressed() {
  object.add(new Box(mouseX, mouseY, 10, 10));
}
