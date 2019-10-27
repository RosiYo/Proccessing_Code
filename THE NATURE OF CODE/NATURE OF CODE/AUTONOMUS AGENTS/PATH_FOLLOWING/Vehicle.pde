class Vehicle {
  PVector loc, vel, acc;
  float mass, maxVel, maxForce, r;

  Vehicle(PVector loc_, PVector vel_) {
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);

    mass = 10;
    r = 5;

    maxVel = random(4, 10);
    maxForce = random(2, 4);
  }

  void display() {
    float theta = vel.heading() + PI/2;
    fill(255, 230, 0, 200);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);

    beginShape();
    vertex(0, -r*2);
    vertex(r, r*2);
    vertex(-r, r*2);
    endShape(CLOSE);
    popMatrix();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc = new PVector(0, 0);
  }

  void applyForce(PVector Force) {
    PVector force = Force.copy();
    force.div(mass);
    acc.add(force);
  }

  void Seek(PVector destinationLoc) {
    PVector direction = destinationLoc.sub(loc);
    direction.setMag(maxVel);

    PVector steering = PVector.sub(direction, vel);
    steering.limit(maxForce);

    applyForce(steering);
  }

  void boundaries() {
    if (loc.x > width) /* => */ loc.x = 0;
    if (loc.x < 0) /* => */ loc.x = width;

    if (loc.y > height) /* => */ loc.y = 0;
    if (loc.y < 0) /* => */ loc.y = height;
  }

  void run(Path path) {
    boundaries();
    display();
    update();
    follow(path);

    if (keyPressed) {
      drawReferences(path);
    }
  }

  void follow(Path path) {
    PVector distanceToPath = PVector.sub(normalPoint(path), futureLocation());

    if (distanceToPath.mag() > path.pathRadius) {
      Seek(target(path));
    }
  }

  void drawReferences(Path path) {
    push();
    noStroke();
    fill(255, 0, 0, 100);
    ellipse(futureLocation().x, futureLocation().y, 6, 6);
    fill(0, 255, 0, 100);
    ellipse(normalPoint(path).x, normalPoint(path).y, 6, 6);
    fill(0, 0, 255, 100);
    ellipse(target(path).x, target(path).y, 6, 6);
    pop();
  }

  PVector target(Path path) {
    PVector fromStartToEnd = PVector.sub(path.start, path.end);

    fromStartToEnd.normalize();
    fromStartToEnd.mult(25);
    PVector targetLocation = PVector.add(normalPoint(path), fromStartToEnd);

    return targetLocation;
  }

  PVector normalPoint(Path path) {
    PVector fromStartToFutureLocation = PVector.sub(loc, path.start);
    PVector fromStartToEnd = PVector.sub(path.start, path.end);

    fromStartToEnd.normalize();
    fromStartToEnd.mult(fromStartToFutureLocation.dot(fromStartToEnd));

    PVector normalPoint_ = PVector.add(path.start, fromStartToEnd);
    return normalPoint_;
  }

  PVector futureLocation() {
    PVector vel_ = vel.copy();
    vel_.mult(25);

    PVector futureLocation_ = PVector.add(loc, vel_);
    return futureLocation_;
  }

  boolean isOnPath(Path path) {
    if (normalPoint(path).x >= path.start.x && normalPoint(path).x <= path.end.x) { 
      return true;
    } else {
      return false;
    }
  }
}
