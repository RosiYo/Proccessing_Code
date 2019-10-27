Mover m;

void setup(){
 size(600,600); 
 m = new Mover();
}

void draw(){
  translate(width/2,height/2);
  background(220);
  
  m.display();
  m.update();
  m.checkEdges();
}
