Target desiredLocation;
Vehicle seeker;

PVector initialSeekerLoc, initialSeekerVel, targetLoc;

void setup() {
  size(600, 600);

  initialSeekerLoc = new PVector(0, height);
  initialSeekerVel = new PVector(1, -1);

  seeker = new Vehicle(initialSeekerLoc, initialSeekerVel);
}

void draw() {
  background(230);

  targetLoc = new PVector(mouseX, mouseY);
  desiredLocation = new Target(targetLoc);

  seeker.run(targetLoc);
  desiredLocation.display();
}
