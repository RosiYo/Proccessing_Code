Ball[] balls = new Ball[10];
Liquid l;
PVector Drag, GForce;
float cD = -0.01;
int x = 60;

void setup(){
  size(750, 600);
  l = new Liquid(0, height/2, width, height/2, cD);
  for(int i = 0; i < 10; i++){
    balls[i] = new Ball(x,30,random(0.2, 0.5));
    x += 70;
  }
}

void draw(){
  background(255);
  
  fill(59, 31, 178);
  text("Click to reset",10,20);
  
  l.display();
  
  for(Ball b : balls){
    GForce = new PVector(0, 0.2*b.mass);
    
    if(l.contains(b)){
      Drag = l.drag(b);
      b.applyForce(Drag);
    }
    
    b.display();
    b.applyForce(GForce); 
    b.update();
    b.checkEdges();
  }
}

void mousePressed(){
  x = 60;
  for(int i = 0; i < 10; i++){
    balls[i] = new Ball(x,30,random(0.2, 0.5));
    x += 70;
  }
}
