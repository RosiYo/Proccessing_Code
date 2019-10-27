class Walker{
  float x,y;
  float tx,ty;
  
  Walker(){
    tx = 0;
    ty = 1000;
  }
  
  void update(){
    x = map(noise(tx),0,1,0,width);
    y = map(noise(ty),0,1,0,width);
    
    tx += 0.01;
    ty += 0.01;
  }
  
  void display(){
    fill(0,10);
    rect(x,y,2,2);
  }
}
