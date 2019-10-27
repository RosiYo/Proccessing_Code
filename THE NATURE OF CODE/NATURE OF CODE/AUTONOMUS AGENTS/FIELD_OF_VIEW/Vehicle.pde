class Vehicle {

  PVector direction;
  PVector loc, vel, acc;
  float mass, maxVel, maxForce, r;
  float distanceToSeek, angleToSeek;

  Vehicle(PVector loc_, PVector vel_) {
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);
    
    distanceToSeek = 200;
    angleToSeek = 45;

    mass = 10;
    r = 5;

    maxVel = 2;
    maxForce = 1;
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

  void Seek(PVector destinationLoc_) {
    if (fieldOfView(destinationLoc_)) {
      direction.setMag(maxVel);

      PVector steering = PVector.sub(direction, vel);
      steering.limit(maxForce);

      applyForce(steering);
    }
  }

  void fielOfView_display() {
    pushMatrix();
      translate(loc.x, loc.y);
      rotate(vel.heading());
    
      fill(255, 22, 22, 100);
      stroke(100);
      strokeWeight(2);
      
      arc(0, 0, distanceToSeek*2, distanceToSeek*2, -radians(angleToSeek), radians(angleToSeek), PIE);
    popMatrix();
  }
  
   void boundaries(){
    if(loc.x > width) /* => */ loc.x = 0;
    if(loc.x < 0) /* => */ loc.x = width;
    
    if(loc.y > height) /* => */ loc.y = 0;
    if(loc.y < 0) /* => */ loc.y = height;
  }

  void run(PVector destinationLoc_) {
    boundaries();
    fielOfView_display();
    display();
    Seek(destinationLoc_);
    update();
  }

  boolean fieldOfView(PVector destinationLoc) {
    direction = PVector.sub(destinationLoc, loc);

    float magnitudeMult = direction.mag() * vel.mag();
    float dotProduct = vel.dot(direction);

    float theta = acos(dotProduct / magnitudeMult);

    if (theta <= radians(angleToSeek) && direction.mag() <= distanceToSeek) {
      return true;
    } else {
      return false;
    }
  }
}
