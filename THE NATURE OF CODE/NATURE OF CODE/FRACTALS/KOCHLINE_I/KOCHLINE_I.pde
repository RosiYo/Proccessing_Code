ArrayList <KochLine> kochLines;
int delay = 0;

void setup() {
  fullScreen();
  kochLines = new ArrayList <KochLine>();
  kochLines.add(new KochLine(new PVector(0, height-80), new PVector(width, height-80)));
}

void draw() {
  background(255);

  if (mousePressed && delay > 60) {
    generate();
    delay = 0;
  }
  
  if(keyPressed){
    kochLines.clear();
    kochLines.add(new KochLine(new PVector(0, height-80), new PVector(width, height-80)));
  }

  for (KochLine kochLine : kochLines) {
    kochLine.display();
  }
  
  delay++;
}

void generate() {
  ArrayList <KochLine> nextGeneration = new ArrayList <KochLine>();
  for (KochLine kochLine : kochLines) {
    PVector pointA = kochLine.findPointA();
    PVector pointB = kochLine.findPointB();
    PVector pointC = kochLine.findPointC();
    PVector pointD = kochLine.findPointD();
    PVector pointE = kochLine.findPointE();

    nextGeneration.add(new KochLine(pointA, pointB));
    nextGeneration.add(new KochLine(pointB, pointC));
    nextGeneration.add(new KochLine(pointC, pointD));
    nextGeneration.add(new KochLine(pointD, pointE));
  }
  kochLines = nextGeneration;
}
