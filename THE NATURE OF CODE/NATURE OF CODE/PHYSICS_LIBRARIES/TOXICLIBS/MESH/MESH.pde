import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;

VerletPhysics2D world;
ArrayList <Particle> particles;
ArrayList <Spring> springs;

int cols, rows;
int scl = 20;

void setup() {
  size(600, 600);

  world = new VerletPhysics2D();
  world.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  world.setWorldBounds(new Rect(0, 0, width, height));

  cols = 20;
  rows = 20;

  particles = new ArrayList <Particle>();
  springs = new ArrayList <Spring>();

  float YParticleLocation = 50;
  for (int i = 0; i < rows - 1; i++) {
    float XParticleLocation = 100;
    for (int j = 0; j < cols; j++) {
      particles.add(new Particle(new Vec2D(XParticleLocation, YParticleLocation)));
      XParticleLocation += scl;
    }
    YParticleLocation += scl;
  }

  horizontalSprings();
  verticalSprings();

  for (Spring spring : springs) {
    world.addSpring(spring);
  }

  for (Particle particle : particles) {
    world.addParticle(particle);
  }

  Particle particleLocked1 = particles.get(0);
  particleLocked1.lock();
  
  Particle particleLocked2 = particles.get(cols - 1);
  particleLocked2.lock();
}

void draw() {
  background(255);
  world.update();

  //for (Particle particle : particles) {
  //  particle.display();
  //}

  for (Spring spring : springs) {
    spring.display();
  }
}

void horizontalSprings() {
  for (int i = 0; i < particles.size() - 1; i++) {
    Particle firstConnection = particles.get(i);
    Particle secondConnection = particles.get(i+1);
    if (firstConnection.location.y == secondConnection.location.y) {
      springs.add(new Spring(firstConnection, secondConnection, scl, 0.2));
    }
  }
}

void verticalSprings() {
  for (int i = 0; i < particles.size() - cols; i++) {
    Particle firstConnection = particles.get(i);
    Particle secondConnection = particles.get(i+cols);
    if (firstConnection.location.y != secondConnection.location.y) {
      springs.add(new Spring(firstConnection, secondConnection, scl, 0.2));
    }
  }
}
