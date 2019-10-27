class WaterParticle extends Particle {
  PImage img1, img2;

  WaterParticle(PVector l, float mass_, PImage img1_, PImage img2_) {
    super(l, mass_); 
    img1 = img1_;
    img2 = img2_;
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(a);
    
    float check = random(1);
    
    if (check <= 0.5) {
      image(img1, 0, 0, 10, 10);
    } else {
      image(img2, 0, 0, 10, 10);
    }

    popMatrix();
  }
}
