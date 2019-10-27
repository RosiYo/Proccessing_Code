import peasy.*;

PeasyCam camera;
ArrayList <Attractor> attractors;
float time = 0.01;

void setup() {
  size (600, 600, P3D);
  camera = new PeasyCam(this, 400);
  attractors = new ArrayList <Attractor> ();
}

void draw() {
  background(0);
  translate(0, 0, -80);
  stroke(255);
  noFill();
  scale(3);

  attractors.add(new Attractor (10, 28, 8/3, time));

  for (Attractor attractor : attractors) {
    attractor.display();
  }
}
