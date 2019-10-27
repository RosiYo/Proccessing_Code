class Proton extends Vehicle{
  
  PImage protonAppearance;
  
  Proton(PVector location, PImage proton_){
    super(location);
    protonAppearance = proton_;
  }
  
  void display(){
    image(protonAppearance, location.x, location.y);
  }
  
  void followCurrent(){
    PVector desiredVelocity = currentFlow.lookUp(location).mult(maxSpeed);
    PVector steering = PVector.sub(desiredVelocity, velocity);
    steering.limit(maxForce);
    applyForce(steering);
  }
  
  void run(){
    super.run();
    followCurrent();
  }
}
