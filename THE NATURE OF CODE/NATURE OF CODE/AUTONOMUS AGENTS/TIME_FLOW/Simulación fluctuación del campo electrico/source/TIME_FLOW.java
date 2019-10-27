import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class TIME_FLOW extends PApplet {


ArrayList <Vehicle> vehicles;
FlowField currentFlow;

PImage electron, proton;
int resolution = 40;

public void setup() {
  
  
  electron = loadImage("electron.png");
  proton = loadImage("proton.png");
  
  vehicles = new ArrayList <Vehicle>();
  currentFlow = new FlowField(resolution);
}

public void draw() {
  background(255);
  currentFlow.run();
  
  for (Vehicle vehicle : vehicles) {
    vehicle.run();
  }
}

public void mousePressed() {
  PVector vehiclePosition = new PVector(mouseX, mouseY);
  vehicles.add(new Proton(vehiclePosition, proton));
  vehicles.add(new Electron(vehiclePosition, electron));
}
class Electron extends Vehicle{
  
  PImage electronAppearance;
  
  Electron(PVector location, PImage electron_){
    super(location); 
    electronAppearance = electron_;
  }
  
  public void display(){
    image(electronAppearance, location.x, location.y);
  }
  
  public void avoidCurrent(){
    PVector desiredVelocity = currentFlow.lookUp(location).mult(maxSpeed);
    PVector steering = PVector.sub(desiredVelocity.mult(-1), velocity);
    steering.limit(maxForce);
    applyForce(steering);
  }
  
  public void run(){
    super.run();
    avoidCurrent();
  }
}
class FlowField {

  int resolution;
  int cols, rows;
  PVector Grid [][];
  float timeLapse;

  FlowField(int resolution_) {
    resolution = resolution_;
    makeAGrid();
    timeLapse = 0;
  }

  public void makeAGrid() {
    cols = width / resolution;
    rows = height / resolution;
    Grid = new PVector[cols] [rows];
  }

  public void setVectors() {
    float xoff = timeLapse;
    for (int i = 0; i < cols; i++) {
      float yoff = timeLapse;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        Grid[i][j] = PVector.fromAngle(theta);
        yoff += 0.1f;
      }
      xoff += 0.1f;
    }
    timeLapse += 0.001f;
  }

  public void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(Grid[i][j], i*resolution, j*resolution, resolution-2);
      }
    }
  }

  public void drawVector(PVector vectorToDraw, float XinitialValue, float YinitialValue, float scaleToApply) {
    pushMatrix();

    translate(XinitialValue, YinitialValue);
    rotate(vectorToDraw.heading());

    float vectorSize = vectorToDraw.mag()*scaleToApply;

    stroke(0, 100);
    fill(0, 100);

    line(0, 0, vectorSize, 0);

    beginShape();
      vertex(vectorSize - 3, 2);
      vertex(vectorSize, 0);
      vertex(vectorSize - 3, -2);
    endShape();

    popMatrix();
  }

  public PVector lookUp(PVector vehiclePosition) {
    int column = PApplet.parseInt(constrain(vehiclePosition.x/resolution, 0, cols-1));
    int row = PApplet.parseInt(constrain(vehiclePosition.y/resolution, 0, rows-1));
    return Grid[column][row];
  }

  public void run() {
    setVectors();
    if(keyPressed){
      display();
    }
  }
}
class Proton extends Vehicle{
  
  PImage protonAppearance;
  
  Proton(PVector location, PImage proton_){
    super(location);
    protonAppearance = proton_;
  }
  
  public void display(){
    image(protonAppearance, location.x, location.y);
  }
  
  public void followCurrent(){
    PVector desiredVelocity = currentFlow.lookUp(location).mult(maxSpeed);
    PVector steering = PVector.sub(desiredVelocity, velocity);
    steering.limit(maxForce);
    applyForce(steering);
  }
  
  public void run(){
    super.run();
    followCurrent();
  }
}
class Vehicle{
  
  PVector velocity, location, acceleration;
  int maxSpeed, maxForce;
  int radius, mass;
  
  Vehicle(PVector location_){
    location = location_.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    maxSpeed = 8;
    maxForce = 4;
    
    radius = 8;
    mass = 10;
  }
  
  public void update(){
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }
  
  public void display(){
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
  
  public void applyForce(PVector force_){
    PVector force = force_.copy();
    force.div(mass);
    acceleration = force.copy();
  }
  
  public void boundaries(){
    if(location.x > width) /* => */ location.x = 0;
    if(location.x < 0) /* => */ location.x = width;
    
    if(location.y > height) /* => */ location.y = 0;
    if(location.y < 0) /* => */ location.y = height;
  }
  
  public void run(){
    boundaries();
    update();
    display();
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "TIME_FLOW" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
