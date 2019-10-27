import controlP5.*;

ControlP5 controller;

boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;

void setup(){
  fullScreen();
  controller = new ControlP5(this);
  
  controller.addToggle("left")
    .setPosition(20, 40)
    .setSize(50, 20)
    .setColorLabel(0)
    ;
    
  controller.addToggle("right")
    .setPosition(20, 80)
    .setSize(50, 20)
    .setColorLabel(0)
    ;
    
  controller.addToggle("up")
    .setPosition(20, 120)
    .setSize(50, 20)
    .setColorLabel(0)
    ;
    
  controller.addToggle("down")
    .setPosition(20, 160)
    .setSize(50, 20)
    .setColorLabel(0)
    ;
}

void draw(){
  background(255);
  drawCircle(width/2, height/2, 400);
}

void drawCircle(float x, float y, float diameter){
  if(diameter >= 2){
    noFill();
    stroke(0);
    ellipseMode(CENTER);
    ellipse(x, y, diameter, diameter);
    
    if(right) drawCircle(x + diameter/2, y, diameter/2);
    if(left) drawCircle(x - diameter/2, y, diameter/2);
    
    if(down) drawCircle(x, y + diameter/2, diameter/2);
    if(up) drawCircle(x, y - diameter/2, diameter/2);
  }
}
