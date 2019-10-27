class Square{
  float a, aVel, aAcc;
  
  Square(){
    a = 0;
    aVel = 0;
    aAcc = 0.001;
  }
  
 void display(){
   fill(200);
   rectMode(CENTER);
     
   pushMatrix();
     translate(width/2, height/2);
     rotate(a);
     rect(0, 0, 80, 40);
   popMatrix();
 }
 
 void update(){
   constrain(aVel, 0, 1);
   a += aVel;
   aVel += aAcc;
 }
 
 void run(){
  update();
  display();
 }
}
