class ParticleSystem {
  ArrayList<Particle> p;
  PVector l;
  float mass;
  PImage img1, img2;

  ParticleSystem(PVector l_, float mass_, PImage img1_, PImage img2_) {
    p = new ArrayList<Particle>();
    l = l_.copy();
    mass = mass_;
    img1 = img1_;
    img2 = img2_;
  }

  void display() {
    p.add(new WaterParticle(l, mass, img1, img2));
    p.add(new Particle(l, mass));
  }

  void update() {
    for (int i = p.size() - 1; i >= 0; i--) {
      Particle p_ = p.get(i);
      p_.run();

      if (p_.lifespan <= 0) {
        p.remove(i);
      }
    }
  }

  void run() {
    display();
    update();
  }

  void applyForce(PVector force) {
    for (Particle p_ : p) {
      p_.applyForce(force);
    }
  }
}
