void setup(){
 size(640,400); 
 background(255);
}

void draw(){
  float xloc = randomGaussian();
  float sd = 100;
  float mean = width/2;
  float x = (xloc * sd) + mean;
  
  fill(51, 10);
  noStroke();
  ellipse(x, height/2, 20, 20);
}
