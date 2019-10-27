Vehicle car;
Target destination;

PVector CarPos, CarVel;
PVector TargetPos, TargetVel;

void setup() {
  size(600, 600);

  CarPos = new PVector(10, 10);
  CarVel = new PVector(10, 10);

  TargetVel = new PVector(0, 0);

  car = new Vehicle(CarPos, CarVel);
}

void draw() {
  background(0, 0, 100);
  
  noFill();
  stroke(255);
  ellipse(mouseX, mouseY, 200, 200);
  
  TargetPos = new PVector(mouseX, mouseY);
  destination = new Target(TargetPos, TargetVel);
  destination.run();

  car.update();
  car.display();
  car.Arrive(destination.loc);
}
