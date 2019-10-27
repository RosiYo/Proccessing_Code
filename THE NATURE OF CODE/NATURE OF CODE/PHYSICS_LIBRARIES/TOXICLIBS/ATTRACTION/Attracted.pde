class Attracted extends VerletParticle2D{
  Attracted(Vec2D location_temp){
    super(location_temp);
    world.addParticle(this);
    world.addBehavior(new AttractionBehavior(this, 40, -0.0001));
  }
  
  void display(){
    pushMatrix();
      translate(x, y);
      ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
