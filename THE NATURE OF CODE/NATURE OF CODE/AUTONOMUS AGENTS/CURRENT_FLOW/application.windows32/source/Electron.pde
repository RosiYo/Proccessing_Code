class Electron extends Vehicle{
  
  PImage electronAppearance;
  
  Electron(PVector location, PImage electron_){
    super(location); 
    electronAppearance = electron_;
  }
  
  void display(){
    image(electronAppearance, location.x, location.y);
  }
  
  void avoidCurrent(){
    PVector desiredVelocity = currentFlow.lookUp(location).mult(maxSpeed);
    PVector steering = PVector.sub(desiredVelocity.mult(-1), velocity);
    steering.limit(maxForce);
    applyForce(steering);
  }
  
  void run(){
    super.run();
    avoidCurrent();
  }
}
