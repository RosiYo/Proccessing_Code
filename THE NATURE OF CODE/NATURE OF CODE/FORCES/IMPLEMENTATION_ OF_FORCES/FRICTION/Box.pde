class Box{
  PVector loc, vel, acc;
  float mass;
  float d;
  
  Box(float x, float Mass){
    mass = Mass;
    d = mass*100;
    loc = new PVector(x, height - d);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void display(){
    fill(0);
    rect(loc.x, loc.y, d, d);
  }
  
  void update(){
   vel.add(acc);
   loc.add(vel);
   acc.setMag(0);
  }
  
  void applyForce(PVector force){
    PVector f = force;
    f.div(mass);
    acc.add(f);
  }
  
  void checkEdges(){
    if(loc.x > width){
      loc.x = 0;
    }else if(loc.x < 0){
      loc.x = width;
    }
  }
}
