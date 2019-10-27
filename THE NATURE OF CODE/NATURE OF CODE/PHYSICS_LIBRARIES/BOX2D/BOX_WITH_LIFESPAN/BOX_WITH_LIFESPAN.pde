import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

ArrayList <Box> b;

Box2DProcessing Box2D;

void setup() {
  size(600, 600);
  b = new ArrayList <Box>();
  
  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();
}

void draw() {
  background(255);
  
  Box2D.step();
  
  for(int i = b.size() - 1; i >= 0; i--){
   Box b_ = b.get(i);
   b_.display();
   
   if(b_.lifespan == 0){
     b.remove(i);
   }
  }
}

void mouseDragged() {
  b.add(new Box(mouseX, mouseY, 16, 16));
}
