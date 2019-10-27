class Particle extends VerletParticle2D{
  
  Vec2D location;
  
  Particle(Vec2D location_temp){
    super(location_temp);
    location = location_temp.copy();
  }
  
  void display(){
    pushMatrix();
      translate(x, y);
      fill(0);
      ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
