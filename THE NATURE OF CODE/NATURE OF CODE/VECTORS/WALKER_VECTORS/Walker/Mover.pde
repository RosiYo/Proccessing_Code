class Mover{
  PVector acc, vel, loc;
  float t;
  
  Mover(){
    acc = new PVector(0.02,0.01);
    vel = new PVector(0,0);
    loc = new PVector(0,0);
    t = 0;
  }
  
  void display(){
    ellipse(loc.x,loc.y,20,20);
  }
  
  void update(){
    acc.x = (map(noise(t), 0, 1, -0.1, 0.1));
    acc.y = (map(noise(t + 1000), 0, 1, -0.1, 0.1));
    vel.add(acc);
    loc.add(vel);
    vel.limit(10);
    t += 0.01;
  }
  
  void checkEdges(){
    if(loc.x > width/2){
      loc.x = -width/2;
    }else if(loc.x < -width/2){
      loc.x = width/2;
    }else if(loc.y > height/2){
      loc.y = -height/2;
    }else if(loc.y < -height/2){
      loc.y = height/2;
    }
  }
}
