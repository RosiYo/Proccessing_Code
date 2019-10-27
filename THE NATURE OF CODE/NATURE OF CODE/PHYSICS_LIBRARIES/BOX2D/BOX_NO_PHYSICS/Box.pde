class Box {
  float x, y, w, h;

  Box(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;

    w = w_;
    h = h_;
  }

  void display() {
    fill(200);
    rect(x, y, w, h);
  }
}
