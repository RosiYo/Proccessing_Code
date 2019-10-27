Bug[] b = new Bug[50];
float xloc = 0;
float yloc = 0;

void setup(){
  size(600,600);
  noiseDetail(100);
  for(int x = 0; x < b.length; x++){
    b[x] = new Bug(xloc,yloc, random(0.01,0.1));
    xloc += random(-150, 150);
    yloc += random(-150, 150);
  }
}

void draw(){
  background(200);
  translate(width/2,height/2);
  for(int x = 0; x < b.length; x++){
    b[x].check();
    b[x].updateNoise();
  }
}
