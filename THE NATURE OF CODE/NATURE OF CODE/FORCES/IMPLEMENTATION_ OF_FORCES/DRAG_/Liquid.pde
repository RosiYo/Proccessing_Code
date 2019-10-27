class Liquid{
  float x, y, w, h, cD;
  Liquid(float x_,float y_,float w_, float h_, float cD_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    cD = cD_;
  }
  
  boolean contains(Ball b){
    PVector l = b.loc;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  } 
  
  void display(){
    fill(200);
    noStroke();
    rect(x, y, w, h);
  }
  
  PVector drag(Ball b){
    PVector Drag = b.vel.copy();
    float speed = b.vel.mag();
    Drag.normalize();
    Drag.mult(cD*speed*speed);
    return Drag;
  }
}
