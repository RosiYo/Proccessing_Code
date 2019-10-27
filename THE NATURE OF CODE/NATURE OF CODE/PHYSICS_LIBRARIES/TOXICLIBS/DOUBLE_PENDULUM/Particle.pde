class Particle extends VerletParticle2D{
  
  Vec2D loc_; //Template value
  
  Particle(Vec2D loc){
     super(loc);
     loc_ = loc.copy();
  }
  
  void display(){
    pushMatrix();
      translate(x, y);
      fill(200);
      ellipse(0, 0, 30, 30);
    popMatrix();
  }
}
