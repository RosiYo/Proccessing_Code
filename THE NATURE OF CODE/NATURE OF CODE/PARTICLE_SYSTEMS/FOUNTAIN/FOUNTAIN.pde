PVector l, gravityF, windF;
ArrayList<ParticleSystem> ps;
float mass = 0.2;
PImage img;

void setup() {
  size(600, 600, P2D);
  img = loadImage("bit_map.png");
  ps = new ArrayList<ParticleSystem>();
}

void draw() {
  background(0);
  blendMode(ADD);
  windF = new PVector(map(mouseX, 0, width, -0.05, 0.05), 0);

  for (ParticleSystem ps_ : ps) {
    gravityF = new PVector(0, 0.2);
    gravityF.mult(ps_.mass);
    ps_.applyForce(gravityF);

    if (mousePressed) {
      ps_.applyForce(windF);
    }

    ps_.run();
  }
}

void keyPressed() {
  l  = new PVector(mouseX, mouseY);
  ps.add(new ParticleSystem(l, mass, img));
}
