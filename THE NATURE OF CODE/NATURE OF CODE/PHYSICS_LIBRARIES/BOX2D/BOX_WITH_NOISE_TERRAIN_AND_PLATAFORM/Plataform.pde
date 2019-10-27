class Plataform{
  Body body;
  float w, h, x, y;
  
 Plataform(float x_, float y_, float w_, float h_){
   w = w_;
   h = h_;
   x = x_;
   y = y_;
   
   BodyDef bd = new BodyDef();
   bd.type = BodyType.STATIC;
   bd.position.set(Box2D.coordPixelsToWorld(x,y));
   
   body = Box2D.createBody(bd);
   
   PolygonShape ps = new PolygonShape();
   float realW = Box2D.scalarPixelsToWorld(w/2);
   float realH = Box2D.scalarPixelsToWorld(h/2);
   ps.setAsBox(realW, realH);
   
   body.createFixture(ps, 1);
 }
 
 void display(){
   fill(0);
   rectMode(CENTER);
   rect(x, y, w, h);
 }
}
