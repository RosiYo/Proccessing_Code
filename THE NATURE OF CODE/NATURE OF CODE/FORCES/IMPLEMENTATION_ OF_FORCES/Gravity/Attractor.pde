class Attractor{
  float x, y, mass, r, G;
  PVector loc, Gravity;
  
  Attractor(float x_, float y_, float mass_){
    x = x_;
    y = y_;
    mass = mass_;
    r = mass*50;
    G = 0.03;
    loc = new PVector(x, y);
    Gravity = new PVector();
  }
  
  void display(){
    fill(253, 155, 154);
    stroke(100);
    ellipse(loc.x, loc.y, r, r);
  }
  
  PVector attract(Mover M){
    Gravity = PVector.sub(loc, M.loc);
    float dir = Gravity.mag();
    dir = constrain(dir,4,15);
    Gravity.normalize();
    Gravity.mult(r*M.r*G/(dir*dir));
    return Gravity;
  }
}
