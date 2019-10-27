class Ball{
  PVector loc, vel, acc, position;
  float mass, r;
  
  Ball(float x, float y, float Mass){
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = Mass;
    r = mass*100;
  }
  
  void display(){
   fill(100);
   ellipse(loc.x, loc.y, r, r); 
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
    if(loc.x > width - r/2 || loc.x < -width + r/2){
      loc.x = width - r/2;
      vel.x *= -1;
    }else if(loc.y > height - r/2 || loc.y < -height + r/2){
      loc.y = height - r/2;
      vel.y *= -1;
    }
  }
}
