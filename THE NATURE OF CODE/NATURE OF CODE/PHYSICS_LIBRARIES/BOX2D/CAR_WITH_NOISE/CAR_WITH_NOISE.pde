import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing Box2D;
Car car;
Terrain terrain;

PVector ChasisPos, FrontWheelPos, BackWheelPos;
float FrontWheelSize, BackWheelSize;
PImage ChasisImage, WheelImage;

void setup() {
  size(600, 600);

  ChasisPos = new PVector(40, height/2);
  FrontWheelPos = new PVector(50, height/2 + 10);
  BackWheelPos = new PVector(30, height/2 + 10);

  FrontWheelSize = 10;
  BackWheelSize = 10;

  Box2D = new Box2DProcessing(this);
  Box2D.createWorld();

  ChasisImage = loadImage("IMAGES/Car.png");
  WheelImage = loadImage("IMAGES/Wheel.png");
  
  terrain = new Terrain();
  car = new Car(ChasisPos, ChasisImage, WheelImage, FrontWheelPos, FrontWheelSize, BackWheelPos, BackWheelSize);
}

void draw() {
  background(255);

  Box2D.step();
  terrain.display();
  car.display();
}

void mousePressed(){
  car.toggleMotor();
}

void keyPressed(){
  if(keyCode == ENTER){
    car.toggleDirection();
  }
}
