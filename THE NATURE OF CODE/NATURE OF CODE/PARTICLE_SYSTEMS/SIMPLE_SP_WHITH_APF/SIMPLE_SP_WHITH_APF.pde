PVector l, windF, gravityF;
ArrayList<Particle> p;


void setup(){
  size(600, 600);
  l  = new PVector(width/2, 40);
  p = new ArrayList<Particle>();
}

void draw(){
  background(255);
  p.add(new Particle(l, 0.2));
  
  stroke(0);
  strokeWeight(4);
  line(width/2, 20, mouseX, 20);
  
  for(int i = p.size() - 1; i >= 0; i--){
    Particle p_ = p.get(i);
    windF = new PVector((mouseX-width/2)*0.0001, 0);
    gravityF = new PVector(0, 0.1 * p_.mass);
    p_.run();
    p_.applyForce(windF);
    p_.applyForce(gravityF);
    
    if(p_.lifespan <= 0){
     p.remove(i); 
    }
  }
}
