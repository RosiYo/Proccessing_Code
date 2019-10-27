
ArrayList <Vehicle> vehicles;
FlowField currentFlow;

PImage electron, proton;
int resolution = 40;

void setup() {
  size(800, 600);
  
  electron = loadImage("electron.png");
  proton = loadImage("proton.png");
  
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
  vehicles.add(new Proton(vehiclePosition, proton));
  vehicles.add(new Electron(vehiclePosition, electron));
}
