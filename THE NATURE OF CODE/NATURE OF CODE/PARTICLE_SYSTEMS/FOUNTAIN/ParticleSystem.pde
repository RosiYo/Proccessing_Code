class ParticleSystem {
  ArrayList<Particle> p;
  PVector l;
  float mass;
  PImage img;

  ParticleSystem(PVector l_, float mass_, PImage img_) {
    p = new ArrayList<Particle>();
    l = l_.copy();
    mass = mass_;
    img = img_;
  }

  void display() {
    p.add(new WaterParticle(l, mass, img));
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
