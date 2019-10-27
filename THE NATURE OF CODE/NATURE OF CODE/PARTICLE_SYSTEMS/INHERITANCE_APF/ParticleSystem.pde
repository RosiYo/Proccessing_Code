class ParticleSystem {
  ArrayList<Particle> p;
  PVector l;
  float mass;

  ParticleSystem(PVector l_, float mass_) {
    p = new ArrayList<Particle>();
    l = l_.copy();
    mass = mass_;
  }

  void display() {
    p.add(new StarParticle(l, mass));
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
