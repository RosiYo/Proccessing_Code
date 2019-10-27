Square s;
float mass = 0.2;

void setup(){
  s = new Square(mass);
  size(600, 600);
}

void draw(){
  background(255);
  
  PVector gravity = new PVector(0, 1);
  gravity.mult(mass);
  
  PVector wind = new PVector(map(mouseX, 0, width, -0.2, 0.2), 0);
  
  s.applyForce(wind);
  s.applyForce(gravity);
  s.run();
}
