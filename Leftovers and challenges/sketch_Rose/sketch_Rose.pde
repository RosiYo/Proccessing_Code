float theta = 0;
float n0 = 1;
float d0 = 1;

void setup(){
  background(255);
  size(500, 500);
}

void draw(){
  translate(width/2, height/2);
  Rose(n0, d0);
  theta += 0.5;
}

void Rose(float n, float d){
  float k = n/d;
  float x = cos(k*theta)*cos(theta)*100;
  float y = cos(k*theta)*sin(theta)*100;
  
  point(x,y);
}

void keyPressed(){
  if(keyCode == UP){
    n0++;
  }else if(keyCode == DOWN){
    n0--;
  }
}
