ArrayList <CantorLine> cantorLines;

void setup() {
  background(255);
  fullScreen();
  cantorLines = new ArrayList <CantorLine>();
  cantorLines.add(new CantorLine(new PVector(0, 20), new PVector(width, 20)));
}

void draw() {
  if(mousePressed){
    newGeneration(); 
  }
  
  for(CantorLine cantorLine : cantorLines){
    cantorLine.displayLine();
  }
}

void newGeneration() {
  ArrayList <CantorLine> nextGeneration = new ArrayList <CantorLine>();
  for (CantorLine cantorLine : cantorLines) {
    PVector pointA = cantorLine.findPointA();
    PVector pointB = cantorLine.findPointB();
    PVector pointC = cantorLine.findPointC();
    PVector pointD = cantorLine.findPointD();
    
    if(pointA.y < height){
      nextGeneration.add(new CantorLine(pointA, pointB));
      nextGeneration.add(new CantorLine(pointC, pointD));
    }
  }
  cantorLines = nextGeneration;
}
