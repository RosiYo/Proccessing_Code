class Bug{
  PVector acceleration;
  PVector velocity;
  PVector location;
  float xoff;
  float yoff;
  float incR;
    
  Bug(float xloc,float yloc, float inc){
    velocity = new PVector (0,0);
    location = new PVector(xloc,yloc);
    xoff = 100;
    yoff = 10;
    incR = inc;
  }
  
  void check(){
    if(location.x > width/2){
      location.x = -width/2;
    }else if(location.x < -width/2){
      location.x = width/2;
    }else if(location.y > height/2){
      location.y = -height/2;
    }else if(location.y < -height/2){
      location.y = height/2;
    }
  }
  
  void updateNoise(){
    float a = map(noise(xoff),0,1,-1,1);
    float b = map(noise(yoff),0,1,-1,1);
    acceleration = new PVector (a , b);
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    xoff += incR;
    yoff += incR;
    ellipse(location.x,location.y,20,20);
  }
}
