import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing Box2D;
ArrayList <Box> boxes;
Plataform plataform;

Vec2 Wind;

void setup() {
  size(600, 600);

  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();

  boxes = new ArrayList <Box>();
  plataform = new Plataform(width/2, height - 50, 200, 20);

  Wind = new Vec2(200, 0);
}

void draw() {
  background(255);
  Box2D.step();

  float r = random(1);
  if (r >= 0.8) /* => */ boxes.add(new Box(random(width), -20, 20, 20));

  for (int i = boxes.size() - 1; i >= 0; i--) {
    Box b = boxes.get(i);
    
    if (mousePressed) {
      b.applyForce(Wind);
    }
    
    b.display();

    if (b.destroy()) {
      Fixture f = b.body.getFixtureList();
      b.body.destroyFixture(f);

      boxes.remove(i);
    }
  }

  plataform.display();
}
