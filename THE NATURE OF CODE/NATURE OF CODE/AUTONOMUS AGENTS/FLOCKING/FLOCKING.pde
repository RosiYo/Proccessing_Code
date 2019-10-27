import controlP5.*;

float separationValue = 1.5;
float cohesionValue = 1;
float alignmentValue = 1;

boolean displayFOV = false;
boolean activateRepeler = false;

float maxVelocityValue = 4;
float maxForceValue = 2;

ArrayList <Vehicle> flocking;
ControlP5 controler;

void setup() {
  fullScreen();
  
  cursor(CROSS);
  
  controler = new ControlP5(this);
  controlers();
  
  flocking = new ArrayList <Vehicle>();

  for (int i = 0; i < 100; i++) {
    flocking.add(new Vehicle(new PVector(random(width), random(height)), new PVector(random(-4, 4), random(-4, 4))));
  }
}

void draw() {
  background(50);
  
  textSize(60);
  textAlign(CENTER);
  fill(255);
  text("FLOCKING SIMULATION", width/2, 80);
  
  for(Vehicle boid : flocking){
    boid.run(flocking);
  }
}

void controlers(){
    controler.addSlider("separationValue")
    .setPosition(20, 20)
    .setRange(0, 5)
  ;
  
  controler.addSlider("cohesionValue")
    .setPosition(20, 40)
    .setRange(0, 5)
  ;
  
  controler.addSlider("alignmentValue")
    .setPosition(20, 60)
    .setRange(0, 5)
  ;
  
  controler.addToggle("displayFOV")
    .setPosition(20, 80)
    .setSize(20, 20)
  ;
  
  controler.addToggle("activateRepeler")
    .setPosition(80, 80)
    .setSize(20, 20)
  ;
  
  controler.addSlider("maxVelocityValue")
    .setPosition(width - 200, 20)
    .setRange(0, 10)
  ;
  
  controler.addSlider("maxForceValue")
    .setPosition(width - 200, 40)
    .setRange(0, 5)
  ;
}
