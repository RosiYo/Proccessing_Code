import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing Box2D;

ArrayList <Bounderi> bounderies;
ArrayList <Box> boxes;
joint j;

void setup() {
  size(600, 600); 

  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();

  bounderies = new ArrayList <Bounderi>();
  boxes = new ArrayList <Box>();
  j = new joint();

  addBounderies();
}

void draw() {
  background(255);
  Box2D.step();
  
  j.update(mouseX, mouseY);
  j.display();

  for (Bounderi b : bounderies) {
    b.display();
  }

  for (Box b : boxes) {
    b.display();
  }
}

void addBounderies() {
  bounderies.add(new Bounderi(width/2, height - 10, width, 20));
  bounderies.add(new Bounderi(10, height/2, 20, height));  
  bounderies.add(new Bounderi(width - 10, height/2, 20, height)); 
  bounderies.add(new Bounderi(width/2, 10, width, 20));
}

void keyPressed() {
  boxes.add(new Box(mouseX, mouseY, 20, 20));
}

void mousePressed() {
  for (Box b : boxes) {
    if (b.contains(mouseX, mouseY)) {
      j.makeJoint(mouseX, mouseY, b);
    }
  }
}

void mouseReleased() {
  j.destroy();
}
