class ParticleSystem{
  ArrayList<Particle> p;
  PVector l;
  
  ParticleSystem(PVector l_){
    p = new ArrayList<Particle>();
    l = l_.copy();
  }
  
  void display(){
    p.add(new Particle(l, 0.2));
    p.add(new StarParticle(l, 0.2));
  }
  
  void update(){
    for(int i = p.size() - 1; i >= 0; i--){
      Particle p_ = p.get(i);
      PVector gravityF = new PVector(0, 0.1 * p_.mass);
      p_.run();
      p_.applyForce(gravityF);
    
      if(p_.lifespan <= 0){
        p.remove(i); 
      }
    }
  }
  
  void run(){
   display();
   update();
  }
}
