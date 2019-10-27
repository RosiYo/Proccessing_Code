class Pendulum{
  PVector origin;
  PVector location;
  float len;
  
  float a;
  float aVel;
  float aAcc;
  float damping;
  
  Pendulum(PVector origin_, PVector location_, float len_, float angle){
    origin = origin_.copy();
    location = location_.copy();
    len = len_;
    a = angle;
    damping = 0.994;
  }
  
  void display(){
   location.set(sin(a)*len, cos(a)*len);
   location.add(origin);
    
    stroke(0);
    line(origin.x, origin.y, location.x, location.y);
    ellipse(location.x, location.y, 30, 30);
    
    if (mousePressed){
      a = map(mouseX, 0, width, -PI/2, PI/2);
      aVel = 0;
    }
  }
  
  void update(){
    float G = 0.4;
    aAcc = (-1 * G / len) * sin(a);
    
    aVel += aAcc;
    a += aVel;
    
    aVel *= damping;
  }
}
