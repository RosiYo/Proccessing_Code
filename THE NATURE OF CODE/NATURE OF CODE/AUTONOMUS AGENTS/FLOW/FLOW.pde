
ArrayList <Vehicle> vehicles;
FlowField currentFlow;
int resolution = 40;

void setup() {
  size(800, 600);
  vehicles = new ArrayList <Vehicle>();
  currentFlow = new FlowField(resolution);
}

void draw() {
  background(255);
  currentFlow.run();
  
  for (Vehicle vehicle : vehicles) {
    vehicle.run();
  }
}

void mousePressed() {
  PVector vehiclePosition = new PVector(mouseX, mouseY);
  vehicles.add(new Vehicle(vehiclePosition));
}
