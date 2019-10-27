class Vehicle {

  PVector loc, vel, acc;
  float mass, maxVel, maxForceSeeking, maxForceFleeing, r;

  Vehicle(PVector loc_, PVector vel_) {
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);

    mass = 10;
    r = 5;

    maxVel = 5;
    maxForceSeeking = 2;
    maxForceFleeing = 6;
  }

  void display() {
    float theta = vel.heading() + PI/2;
    fill(175);
    stroke(0);
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
    PVector direction = PVector.sub(destinationLoc, loc);
    direction.setMag(maxVel);

    PVector steering = PVector.sub(direction, vel);
    steering.limit(maxForceSeeking);

    applyForce(steering);
  }

  void Flee(PVector avoidTargetLoc) {
    PVector direction = PVector.sub(avoidTargetLoc, loc);
    if (direction.mag() < 100) {
      direction.setMag(maxVel);

      PVector steering = PVector.sub(direction, vel);
      steering.limit(maxForceFleeing);
      steering.mult(-1);

      applyForce(steering);
    }
  }
}
