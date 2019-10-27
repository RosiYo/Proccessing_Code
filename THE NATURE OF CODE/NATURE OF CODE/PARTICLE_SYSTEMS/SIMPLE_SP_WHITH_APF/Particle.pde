class Particle{
 PVector loc, vel, acc;
 float mass;
 int lifespan;
 
 Particle(PVector l, float mass_){
  loc = l.copy();
  vel = new PVector(random(-1, 1), random(-2, 0));
  acc = new PVector(0, 0);
  lifespan = 255;
  mass = mass_;
 }
 
 void display(){
  stroke(0, lifespan);
  strokeWeight(1);
  fill(0, lifespan);
  ellipse(loc.x, loc.y, mass*50, mass*50); 
 }
 
 void update(){
   vel.add(acc);
   loc.add(vel);
   acc.setMag(0);
   lifespan -= 2;
 }
 
 void applyForce(PVector force){
   PVector f = force.copy();
   f.div(mass);
   acc.add(f);
 }
 
 void run(){
  update();
  display();
 }
}
