Mover[] movers;
float t = 0;
PVector GForce, Wind, Friction; 
float nu = -0.01;
boolean check = false;

void setup(){
 size(600,600); 
 movers = new Mover[5];
 
 for(int i = 0; i <movers.length; i++){
   movers[i] = new Mover(random(-width/2,width/2), 20, random(1,4));
 }
}

void draw(){
  translate(width/2,height/2);
  background(220);
  Wind = new PVector(map(noise(t), 0, 1, -4, 4), 0);
  check = false;
  
  for(Mover m : movers){
    GForce = new PVector(0, 2);
    GForce.mult(m.mass);
    
    Friction = m.vel.copy();
    Friction.normalize();
    Friction.mult(nu);

    m.display();
    m.update();
    m.checkEdges();
    
    m.applyForce(GForce);
    if (check){
      m.applyForce(Friction);
    }
  }
  textSize(48);
  textAlign(CENTER);
  fill(0);
  text(Wind.x, 0, 0);
  t += 0.01;
}

void mousePressed(){
  for(Mover m : movers){
    m.applyForce(Wind);
    m.update();
    m.checkEdges();
  }
}
