float incx = 0;
float incy = 1000;

void setup() {
  size(600, 600);
}

void draw() {
  loadPixels();
  float xoff = incx;
  for (int x = 0; x<width; x++) {
    float yoff = incy;
    for (int y = 0; y<height; y++) {
      float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
      pixels[x+y*width] = color(bright);
      yoff += 0.03;
    }
    xoff += 0.03;
  }
  updatePixels();
  incx += 0.01;
  incy -= 0.05;
}
