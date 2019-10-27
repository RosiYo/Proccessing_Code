float xloc;
float xsd = 80;
float xmean = 320;
float yloc;
float ysd = 80;
float ymean = 320;
float x;
float y;

void setup(){
  size(640,640);
  background(255);
}

void draw(){
  xloc = randomGaussian();
  yloc = randomGaussian();
  x = (xsd*xloc)+xmean;
  y = (ysd*yloc)+ymean;
  
  fill(51,80);
  noStroke();
  for(int i = 0; i<300; i++){
    ellipse(x, y, 20, 20);
  }
}
