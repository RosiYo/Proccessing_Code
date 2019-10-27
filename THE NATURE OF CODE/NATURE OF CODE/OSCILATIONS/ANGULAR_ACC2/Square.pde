class Square{
  float a, aVel, aAcc, mass;
  PVector loc, vel, acc;
  
  Square(float mass_){
    a = 0;
    aVel = 0;
    aAcc = 0;
    
    loc = new PVector(width/2, 20);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    mass = mass_;
  }
  
 void display(){
   fill(200);
   rectMode(CENTER);
     
   pushMatrix();
     translate(loc.x, loc.y);
     rotate(a);
     rect(0, 0, 80, 40);
   popMatrix();
 }
 
 void update(){
   aAcc = map(loc.x, 0, width, -0.01, 0.01);
   
   constrain(aVel, 0, 0.5);
   a += aVel;
   aVel += aAcc;
   
   loc.add(vel);
   vel.add(acc);
   acc.setMag(0);
 }
 
 void applyForce(PVector force){
   PVector f = force.copy();
   acc.add(f.div(mass));
 }
 
 void checkEdges(){
   if(loc.x > width || loc.x < 0 || loc.y > height || loc.y < 0){
     loc = new PVector(width/2,20);
     vel.setMag(0);
   }
 }
 
 void run(){
  update();
  display();
  checkEdges();
 }
}
