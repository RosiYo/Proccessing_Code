float len = 200;
float angle = PI/4;

PVector origin;
PVector location;

Pendulum p;

void setup(){
 size(600,600); 
 origin = new PVector(width/2, height/2 - 100);
 location = new PVector(sin(angle)*len, cos(angle)*len);
 location.add(origin);
 p = new Pendulum(origin, location, len, angle);
}

void draw(){
  background(255);
  p.display();
  p.update();
}
