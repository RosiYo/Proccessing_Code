class Attractor extends VerletParticle2D{
  Attractor(Vec2D location_temp){
    super(location_temp); 
    
    world.addParticle(this);
    world.addBehavior(new AttractionBehavior(this, 20, -1));
    world.addBehavior(new AttractionBehavior(this, width, 0.008));
  }
  
  void display(){
    pushMatrix();
      translate(x, y);
      ellipse(0, 0, 10*2, 10*2);
    popMatrix();
  }
}
