Spring s;
Bob b;

PVector origin, loc;
float len = 200;

void setup() {
  size(600, 600);
  origin = new PVector(width/2, 50);
  loc = new PVector(width/2, origin.y + len);
  b = new Bob(loc, 0.5);
  s = new Spring(0.005, len, origin);
}

void draw() {
  background(255);

  PVector Gravity = new PVector(0, 2);
  b.applyForce(Gravity);

  s.update(b);
  b.update();
  b.display();
  s.display(b);
  
  if (mousePressed) {
    b.loc = new PVector(mouseX, mouseY);
  }
}
