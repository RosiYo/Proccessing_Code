Box b;
float nu;
PVector Friction, Engine;

void setup(){
  size(1200,200);
  b = new Box (width/2, random(0.1,1));
  Friction = new PVector(0, 0);
  Engine = new PVector(0, 0);
}

void draw(){
  background(255);
  
  fill(232, 232, 0);
  noStroke();
  rect(width/2 - 80, height - 10, 160, 10);
  
  Nu();
  
  Friction = b.vel.copy();
  Friction.mult(nu);
  
  b.display();
  b.applyForce(Friction);
  b.update();
  b.checkEdges();
}

void mousePressed(){
  Engine.add(1, 0);
  b.applyForce(Engine);
  Engine.setMag(0);
}

void Nu(){
  if (b.loc.x >= width/2 - 80 && b.loc.x <= width/2 + 80){
    nu = -0.05;
  }else{
    nu = -0.01;
  }
}
