class Spring{
  float k, restLen;
  PVector origin;
  
 Spring(float k_, float restLen_, PVector origin_){
   k = k_;
   restLen = restLen_;
   origin = origin_.copy();
 }
 
 void display(Bob b){
   stroke(0);
   line(origin.x, origin.y, b.loc.x, b.loc.y);
 }
 
 void update(Bob b){
   PVector force = PVector.sub(b.loc, origin);
   float crrLen = force.mag();
   float x = crrLen - restLen;
   
   force.normalize();
   force.mult(-4 * k * x);
   
   b.applyForce(force);
 }
}
