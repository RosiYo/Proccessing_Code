class FlowField {

  int resolution;
  int cols, rows;
  PVector Grid [][];
  float timeLapse;

  FlowField(int resolution_) {
    resolution = resolution_;
    makeAGrid();
    timeLapse = 0;
  }

  void makeAGrid() {
    cols = width / resolution;
    rows = height / resolution;
    Grid = new PVector[cols] [rows];
  }

  void setVectors() {
    float xoff = timeLapse;
    for (int i = 0; i < cols; i++) {
      float yoff = timeLapse;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        Grid[i][j] = PVector.fromAngle(theta);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    timeLapse += 0.001;
  }

  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(Grid[i][j], i*resolution, j*resolution, resolution-2);
      }
    }
  }

  void drawVector(PVector vectorToDraw, float XinitialValue, float YinitialValue, float scaleToApply) {
    pushMatrix();

    translate(XinitialValue, YinitialValue);
    rotate(vectorToDraw.heading());

    float vectorSize = vectorToDraw.mag()*scaleToApply;

    stroke(0, 100);
    fill(0, 100);

    line(0, 0, vectorSize, 0);

    beginShape();
      vertex(vectorSize - 3, 2);
      vertex(vectorSize, 0);
      vertex(vectorSize - 3, -2);
    endShape();

    popMatrix();
  }

  PVector lookUp(PVector vehiclePosition) {
    int column = int(constrain(vehiclePosition.x/resolution, 0, cols-1));
    int row = int(constrain(vehiclePosition.y/resolution, 0, rows-1));
    return Grid[column][row];
  }

  void run() {
    setVectors();
    if(keyPressed){
      display();
    }
  }
}
