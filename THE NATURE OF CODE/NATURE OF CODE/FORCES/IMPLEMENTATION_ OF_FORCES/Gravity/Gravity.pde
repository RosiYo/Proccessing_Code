Mover[] m = new Mover[10];
Attractor a = new Attractor(0, 0, 0.5);
boolean check = false;
PVector Gravity, dir;

void setup(){
  size(800, 800);
  ellipseMode(CENTER);
  strokeWeight(0.8);
  for(int i = 0; i < 10; i++){
    m[i] = new Mover(random(-width/2 + 50, width/2 - 50),random(-height/2 + 50, height/2 - 50),random(0.2,1));
  }
}

void draw(){
  translate(width/2,height/2);
  background(190, 255, 255);
  
  for(Mover M : m){
    a.display();
    M.display();
    M.update();
    Gravity = a.attract(M);
    M.applyForce(Gravity);
    M.checkEdges();
  }
}

void mousePressed(){
 a.loc = new PVector (mouseX - width/2 ,mouseY - height/2); 
}

void keyPressed(){
 if(keyCode == ENTER){
   for(int i = 0; i < 10; i++){
    m[i] = new Mover(random(-width/2 + 50, width/2 - 50),random(-height/2 + 50, height/2 - 50),random(0.2,1));
   }
 }
}
