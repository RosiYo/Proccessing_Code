class Vehicle{
  
  PVector velocity, location, acceleration;
  int maxSpeed, maxForce;
  int radius, mass;
  
  Vehicle(PVector location_){
    location = location_.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    maxSpeed = 10;
    maxForce = 4;
    
    radius = 8;
    mass = 10;
  }
  
  void update(){
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }
  
  void display(){
    float theta = velocity.heading() + PI/2 ;
    pushMatrix();
      translate(location.x, location.y);
      rotate(theta);
      fill(50);
      noStroke();
      
      beginShape();
        vertex(0, -radius);
        vertex(radius/2, radius);
        vertex(-radius/2, radius);
      endShape(CLOSE);
    popMatrix();
  }
  
  void applyForce(PVector force_){
    PVector force = force_.copy();
    force.div(mass);
    acceleration = force.copy();
  }
  
  void followTheCurrent(){
    PVector desiredVelocity = currentFlow.lookUp(location).mult(maxSpeed);
    PVector steering = PVector.sub(desiredVelocity, velocity);
    steering.limit(maxForce);
    applyForce(steering);
  }
  
  void boundaries(){
    if(location.x > width) /* => */ location.x = 0;
    if(location.x < 0) /* => */ location.x = width;
    
    if(location.y > height) /* => */ location.y = 0;
    if(location.y < 0) /* => */ location.y = height;
  }
  
  void run(){
    boundaries();
    update();
    followTheCurrent();
    display();
  }
}
