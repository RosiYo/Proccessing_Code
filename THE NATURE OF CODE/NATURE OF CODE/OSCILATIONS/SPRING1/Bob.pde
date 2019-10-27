class Bob{
  PVector acc, vel, loc;
  float mass, r;
  
  Bob(PVector pos, float Mass){
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = pos.copy();
    mass = Mass;
    r = mass*50;
  }
  
  void display(){
    fill(255, 255, 150, 150);
    stroke(150);
    ellipse(loc.x,loc.y,r,r);
  }
  
  void applyForce(PVector f){
    PVector force = f.copy();
    force.div(mass);
    acc.add(force);
  }
  
  void update(){
    vel.add(acc);
    vel.limit(10);
    loc.add(vel);
    acc.mult(0);
    vel.mult(0.985);
  }
}
