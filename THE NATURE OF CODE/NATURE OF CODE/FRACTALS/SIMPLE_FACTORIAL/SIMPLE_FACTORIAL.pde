void setup() {
  fullScreen();
}

void draw() {
  background(255);
  textAlign(CENTER, CENTER);
  textSize(height/2);
  fill(0);
  text(factorial(5), width/2, height/2);
}

int factorial(int n) {
  int total = 0;
  if (n > 1) {
    total += n * factorial(n-1);
  } else if (n == 1) {
    return 1;
  }
  return total;
}
