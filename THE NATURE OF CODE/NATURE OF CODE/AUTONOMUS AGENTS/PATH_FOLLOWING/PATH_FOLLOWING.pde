ArrayList<Vehicle> bodies;
ArrayList <Path> terrain;
Path target;

PVector initialLoc, initialVel;
int resolution = 10;

void setup() {
  size(1500, 500);

  terrain = new ArrayList <Path>();
  makePaths();

  initialVel = new PVector(0, 0);
  bodies = new ArrayList<Vehicle>();
}

void draw() {
  background(220);

  initialLoc = new PVector(mouseX, mouseY);

  for (Path path : terrain) {
    path.display();
  }

  searchTarget(bodies, terrain);
}

void mouseClicked() {
  bodies.add(new Vehicle(initialLoc, initialVel));
}

void makePaths() {
  float xoff = 0;

  for (int i = 0; i <= (width/resolution); i++) {
    PVector startPoint = new PVector(i * resolution, map(noise(xoff), 0, 1, 0, height));
    xoff += 0.01;
    PVector endPoint = new PVector((i+1)*resolution, map(noise(xoff), 0, 1, 0, height));

    terrain.add(new Path(startPoint, endPoint));
  }
}

void searchTarget(ArrayList <Vehicle> tempBodies, ArrayList <Path> tempTerrain) {
  for (Vehicle body : tempBodies) {
    float smallestMagnitude = 10000;
    for (Path path : tempTerrain) {
      float tempMagnitude = body.normalPoint(path).mag();

      if (tempMagnitude < smallestMagnitude && body.isOnPath(path)) { 
        smallestMagnitude = tempMagnitude;
        target = path;
      }
    }
    body.run(target);
  }
}
