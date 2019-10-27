PVector l, gravityF;
ArrayList<ParticleSystem> ps;

void setup(){
  size(600, 600);
  ps = new ArrayList<ParticleSystem>();
}

void draw(){
  background(255);
  
  for(ParticleSystem ps_ : ps){
   ps_.run(); 
  }
}

void mousePressed(){
  l  = new PVector(mouseX, mouseY);
  ps.add(new ParticleSystem(l));
}
