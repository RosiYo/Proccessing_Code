Vehicle car;
Target destination;
PVector CarPos, CarVel;

void setup() {
  size(600, 600);

  CarPos = new PVector(10, 10);
  CarVel = new PVector(10, 10);

  car = new Vehicle(CarPos, CarVel);
}

void draw() {
  background(255);
  
  destination = new Target(new PVector(mouseX, mouseY));
  destination.display();
  
  car.update();
  car.display();
  car.Seek(destination.loc);
}
