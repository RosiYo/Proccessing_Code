class Hat2 extends Hat1{
  
  PImage bottom, top;
  
  Hat2(float x, float y, PImage Hat2_bottom, PImage Hat2_top){
   super(x, y, Hat2_bottom, Hat2_top);
   
   bottom = Hat2_bottom;
   top = Hat2_top;
  }
  
  void display(){
    Vec2 pos = Box2D.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      fill(200);
      
      image(bottom, 0, -4);
      
      imageMode(CENTER);
      image(top, 0, -20);
      
    popMatrix();
  }
}
