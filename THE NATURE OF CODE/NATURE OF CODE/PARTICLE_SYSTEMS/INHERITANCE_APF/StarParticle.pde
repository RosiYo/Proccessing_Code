class StarParticle extends Particle{
  StarParticle(PVector l, float mass_){
   super(l, mass_); 
  }
    
   void display(){
   pushMatrix();
     translate(loc.x, loc.y);
     rotate(a);
     
     beginShape();
      fill(100, 100, 200, lifespan);
      noStroke();
      vertex(0 , 0 - 1);
      vertex(0 + mass*50, 0 - 1);
      vertex(0, 0 + mass*50/2);
      vertex(0 + mass*50/2, 0 - mass*50/2);
      vertex(0 + mass*50, 0 + mass*50/2);
     endShape(CLOSE); 
     
   popMatrix();
   }
}
