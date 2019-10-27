import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing Box2D;

ArrayList <Hat1> H;
Limit l;

PImage Hat1_bottom, Hat1_top;
PImage Hat2_bottom, Hat2_top;

void setup() {
  size(600, 600);

  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();

  H = new ArrayList <Hat1>();
  l = new Limit();

  Hat1_bottom = loadImage("IMAGES/HAT1_BOTTOM.png");
  Hat1_top = loadImage("IMAGES/HAT1_TOP.png");
  Hat2_bottom = loadImage("IMAGES/HAT2_BOTTOM.png");
  Hat2_top = loadImage("IMAGES/HAT2_TOP.png");
}

void draw() {
  background(255);

  Box2D.step();

  l.display();

  for (Hat1 h : H) {
    h.display();
  }

  for (int i = H.size() - 1; i >= 0; i--) {
    Hat1 H_ = H.get(i);
    if (H_.done()) {
      H.remove(i);
    }
  }
}

void mousePressed() {
  float random = random(1);

  if (random <= 0.5) { 
    H.add(new Hat1(mouseX, mouseY, Hat1_bottom, Hat1_top));
  } else {
    H.add(new Hat2(mouseX, mouseY, Hat2_bottom, Hat2_top));
  }
}
