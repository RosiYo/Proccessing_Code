class Mover{
  PVector acc, vel, loc;
  float mass, r;
  
  Mover(float posX, float posY, float Mass){
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = new PVector(posX,posY);
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
  }
  
  void checkEdges(){
    if(loc.x > width/2 - r/2 || loc.x < -width/2 + r/2){
      vel.x *= -1;
      check = true;
    }else if(loc.y > height/2 - r/2 || loc.y < -height/2 + r/2){
      vel.y *= -1;
      check = true;
    }
  }
}
