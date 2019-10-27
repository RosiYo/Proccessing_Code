class WaterParticle extends Particle {
  PImage img;

  WaterParticle(PVector l, float mass_, PImage img_) {
    super(l, mass_); 
    img = img_;
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(a);

    image(img, 0, 0, 10, 10);

    popMatrix();
  }
}
