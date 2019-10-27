import controlP5.*;

ControlP5 controller;

int resolution = 4;
int generationNumber = 1;
int ruleNumber = 90;

int[] ruleSet;

ArrayList <Generations> generations;

void setup() {
  fullScreen();
  controlDisplay();

  generations = new ArrayList <Generations>();

  ruleSet = new int[8];
  ruleSet = fromDecimalToBinary(90, ruleSet);

  cellUpdate();
}

void draw() {
  background(255);
  for (Generations generation : generations) {
    generation.displayGeneration();
  }

  fill(0);
  rect(width/2, 0, resolution, resolution);

  fill(71, 74, 255, 200);
  rect(60, 30, 100, 550);
}

public void bang() {
  reset();
}

void reset() {
  generationNumber = 1;
  ruleSet = new int[8];
  ruleSet = fromDecimalToBinary(ruleNumber, ruleSet);

  generations.clear();

  cellUpdate();
}

void cellUpdate() {
  generations.add(new Generations(initialGeneration(), generationNumber));
  for (int i = 0; i < height/resolution - 1; i++) {
    Generations actualGeneration = generations.get(i);
    int[] nextGeneration = actualGeneration.updateGeneration();
    generations.add(new Generations(nextGeneration, generationNumber));
    generationNumber++;
  }
}

void controlDisplay() {
  controller = new ControlP5(this);

  controller.addSlider("ruleNumber")
    .setPosition(100, 50)
    .setSize(20, 500) 
    .setRange(0, 255)
    .setColorValue(255)
    .setColorLabel(255)
    ;

  controller.addBang("bang")
    .setPosition(width - 80, 40)
    .setSize(40, 40)
    .setTriggerEvent(Bang.RELEASE)
    .setColorLabel(150)
    .setLabel("reset")
    ;
}

int[] initialGeneration() {
  int cols = width/resolution;
  int[] initialGeneration_ = new int[cols];

  for (int i = 0; i < initialGeneration_.length; i++) {
    initialGeneration_[i] = 0;
  }
  initialGeneration_[initialGeneration_.length/2] = 1;
  return initialGeneration_;
}

int[] fromDecimalToBinary(int num, int[] temp) {
  int numberToCheck = num;
  int[] ruleSet_ = temp;
  for (int i = ruleSet_.length - 1; i >= 0; i--) {
    float poweredNumber = pow(2, i);
    if (numberToCheck >= poweredNumber && numberToCheck != 0) {
      numberToCheck -= poweredNumber;
      ruleSet_[7-i] = 1;
    } else if (numberToCheck == 0) {
      ruleSet_[7-i] = 0;
    }
  }
  return ruleSet_;
}
