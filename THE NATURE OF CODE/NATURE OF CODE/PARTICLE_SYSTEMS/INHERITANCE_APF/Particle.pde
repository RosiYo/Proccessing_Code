class Particle{
 PVector loc, vel, acc, origin;
 float mass, a, aVel, aAcc;
 int lifespan;
 
 Particle(PVector l, float mass_){
  loc = l.copy();
  origin = l.copy();
  vel = new PVector(random(-1, 1), random(-2, 0));
  acc = new PVector(0, 0);
  lifespan = 255;
  
  mass = mass_;
  
  a = 0;
  aVel = 0;
  aAcc = 0;
 }
 
 void display(){
  stroke(200, lifespan);
  fill(200, lifespan);
  
  pushMatrix();
   translate(loc.x, loc.y);
   rotate(a);
   rect(0, 0, mass*10, mass*10); 
  popMatrix();
 }
 
 void update(){
   vel.add(acc);
   loc.add(vel);
   acc.setMag(0);
   lifespan -= 2;
 }
 
 void angularMotion(){
   if(loc.x / origin.x < 1){
     aAcc = map(loc.x, origin.x - 50, origin.x, 0, -0.002);
   }else{
     aAcc = map(loc.x, origin.x, origin.x + 50, 0, 0.002);
   }
   
   constrain(aVel, 0, 0.1);
   a += aVel;
   aVel += aAcc;
 }
 
 void applyForce(PVector force){
   PVector f = force.copy();
   f.div(mass);
   acc.add(f);
 }
 
 void run(){
  angularMotion();
  update();
  display();
 }
}
