import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing Box2D;
ArrayList <Particle> particles;
Boundary limit;

void setup() {
  size(600, 600);

  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();
  
  Box2D.listenForCollisions();

  particles = new ArrayList <Particle>();
  limit = new Boundary(width/2, height - 10, width, 20);
}

void draw() {
  background(255);

  Box2D.step();  

  if (random(1) >= 0.9) {
    particles.add(new Particle(random(width), -20, 20, 20));
  }

  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    
    if(p.checkEdges()){
       p.destroy();
       particles.remove(i);
    }
  }

  limit.display();
}

void beginContact(Contact contact) {
  Fixture f1 = contact.getFixtureA();
  Fixture f2 = contact.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Particle.class && o2.getClass() == Particle.class) {
    Particle p1 = (Particle) o1;
    p1.change();

    Particle p2 = (Particle) o2;
    p2.change();
  }
}

void endContact(Contact contact) {
}
