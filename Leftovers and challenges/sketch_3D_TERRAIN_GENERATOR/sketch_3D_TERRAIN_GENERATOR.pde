int cols, rows;

int scl = 20;
int w = 2000;
int h = 1600;

float[][] location;

float flying;

void setup(){
  size(600, 600, P3D);
  cols = w/scl;
  rows = h/scl;
  location = new float[cols][rows];
}

void draw(){ 
  flying -= 0.01;
  float yoff = flying;
  for (int y = 0; y < rows - 1; y++){
    float xoff = 0;
    for (int x = 0; x < cols; x++){
      location[x][y] = map(noise(xoff,yoff),0,1,-100,100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(0);
  stroke(0, 80, 0);
  fill(100, 200, 100);
  
  translate(width/2, height/2 + 50);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  
  for (int y = 0; y < rows - 1; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++){
      vertex(x*scl, y*scl, location[x][y]);
      vertex(x*scl, (y+1)*scl, location[x][y+1]);
    }
    endShape();
  }
}
