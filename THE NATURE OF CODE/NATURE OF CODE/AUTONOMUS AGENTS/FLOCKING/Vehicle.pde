class Vehicle {
  PVector loc, vel, acc;
  float mass, maxVel, maxForce, proportion;
  float distanceOfField, angleOfField;
  float minimumDistance;

  Vehicle(PVector loc_, PVector vel_) {
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);

    mass = 10;
    proportion = 5;
    
    minimumDistance = proportion * 4;
    
    distanceOfField = 200;
    angleOfField = 20;

    maxVel = maxVelocityValue;
    maxForce = maxForceValue;
  }

  void display() {
    float theta = vel.heading() + PI/2;
    
    fill(255, 230, 0, 200);
    stroke(50);
    strokeWeight(1);
    
    pushMatrix();
      translate(loc.x, loc.y);
      rotate(theta);
      
      beginShape();
      vertex(0, -proportion*2);
      vertex(proportion, proportion*2);
      vertex(-proportion, proportion*2);
      endShape(CLOSE);
    popMatrix();
  }

  void update() {
    maxVel = maxVelocityValue;
    maxForce = maxForceValue;
    
    vel.limit(10);
    vel.add(acc);
    loc.add(vel);
    acc = new PVector(0, 0);
  }

  void applyForce(PVector Force) {
    PVector force = Force.copy();
    force.div(mass);
    acc.add(force);
  }
  
  void fielOfView_display() {
    pushMatrix();
      translate(loc.x, loc.y);
      rotate(vel.heading());
    
      noFill();
      stroke(100);
      strokeWeight(2);
      
      arc(0, 0, distanceOfField*2, distanceOfField*2, -radians(angleOfField), radians(angleOfField), PIE);
    popMatrix();
  }
  
  void boundaries() {
    if (loc.x > width) /* => */ loc.x = 0;
    if (loc.x < 0) /* => */ loc.x = width;

    if (loc.y > height) /* => */ loc.y = 0;
    if (loc.y < 0) /* => */ loc.y = height;
  }
  
  void applyBehaviors(ArrayList <Vehicle> boids){
    ArrayList <Vehicle> usableVehicles = usableBoids(boids);
    
    PVector separationBehavior = separate(usableVehicles).copy();
    PVector cohesionBehavior = cohesion(usableVehicles).copy();
    PVector alignmentBehavior = alignment(usableVehicles).copy();
    
    separationBehavior.mult(separationValue);
    alignmentBehavior.mult(alignmentValue);
    cohesionBehavior.mult(cohesionValue);
    
    applyForce(separationBehavior);
    applyForce(alignmentBehavior);
    applyForce(cohesionBehavior);
   
    if (activateRepeler){ 
      PVector fleeBehavior = flee().copy();
      fleeBehavior.mult(4);
      
      fill(200, 10);
      noStroke();
      ellipse(mouseX, mouseY, 200, 200);
      applyForce(fleeBehavior);
    }
  }
  
  void run(ArrayList <Vehicle> flockOfBoids){
    applyBehaviors(flockOfBoids);
    update();
    boundaries();
    display();
    if(displayFOV) /* => */ fielOfView_display();
  }
  
  PVector flee(){
    PVector direction = PVector.sub(new PVector(mouseX, mouseY), loc);
    
    if (direction.magSq() < 10000) {
      direction.normalize();
      direction.mult(maxVel);

      PVector steering = PVector.sub(direction, vel);
      steering.limit(maxForce);
      steering.mult(-1);
      
      return steering;
    }else{
      return new PVector(0, 0);
    }
  }
  
  PVector alignment(ArrayList <Vehicle> boids){
    PVector velResults = new PVector();
    int count = 0;
    
    for(Vehicle usableBoid : boids){
      float distance = PVector.dist(usableBoid.loc, loc);
      if(distance > 0){
        velResults.add(usableBoid.vel);
        count++;
      }
    }
    
    if(count > 0){
      velResults.div(count);
      velResults.setMag(maxVel);
      PVector steering = PVector.sub(velResults, vel);
      steering.limit(maxForce);
      return steering;
    }else{
      return new PVector(0, 0);
    }
  }
  
  PVector cohesion(ArrayList <Vehicle> boids){
    PVector locResults = new PVector();
    int count = 0;
    
    for(Vehicle usableBoid : boids){
      float distance = PVector.dist(usableBoid.loc, loc);
      if(distance > 0){
        locResults.add(usableBoid.loc);
        count++;
      }
    }
    
    if(count > 0){
      locResults.div(count);
      locResults.setMag(maxVel);
      PVector steering = PVector.sub(locResults, vel);
      steering.limit(maxForce);
      return steering;
    }else{
      return new PVector(0, 0);
    }
  }
  
  PVector separate(ArrayList <Vehicle> boids){
    PVector fleeDirection = new PVector();
    int count = 0;
    
    for(Vehicle usableBoid : boids){
      float distance = PVector.dist(usableBoid.loc, loc);
      if(distance > 0 && distance <= minimumDistance){
        PVector direction = PVector.sub(loc, usableBoid.loc);
        direction.normalize();
        direction.div(distance);
        fleeDirection.add(direction);
        count++;
      }
    }
    
    if(count > 0){
      fleeDirection.div(count);
      fleeDirection.normalize();
      fleeDirection.mult(maxVel);
      
      PVector steering = PVector.sub(fleeDirection, vel);
      steering.limit(maxForce);
      
      return steering;
    }else{
      return new PVector(0, 0);
    }
  }
  
  boolean fieldOfView(PVector destinationLoc) {
    PVector direction = PVector.sub(destinationLoc, loc);

    float magnitudeMult = direction.mag() * vel.mag();
    float dotProduct = vel.dot(direction);

    float theta = acos(dotProduct / magnitudeMult);

    if (theta <= radians(angleOfField) && direction.mag() <= distanceOfField) {
      return true;
    } else {
      return false;
    }
  }
  
  ArrayList <Vehicle> usableBoids (ArrayList <Vehicle> boids) {
    ArrayList <Vehicle> usableBoids_ = new ArrayList<Vehicle>();
    for(Vehicle boid : boids){
      if(fieldOfView(boid.loc)){
        usableBoids_.add(boid);
      }
    }
    return usableBoids_;
  }
}
