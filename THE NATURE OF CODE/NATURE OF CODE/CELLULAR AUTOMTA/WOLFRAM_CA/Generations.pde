class Generations {
  int[] actualGeneration;
  int numberOfGen;
  
  Generations(int[] actualGeneration_, int numberOfGen_) {
    actualGeneration = actualGeneration_;
    numberOfGen = numberOfGen_;
  }

  void displayGeneration() {
    for (int i = 0; i < actualGeneration.length - 1; i++) {
      if (actualGeneration[i] == 1) fill(0);
      else if (actualGeneration[i] == 0) fill(255);
      noStroke();
      rect(i*resolution, numberOfGen*resolution, resolution, resolution);
    }
  }

  int[] updateGeneration() {
    int[] nextGeneration = new int[actualGeneration.length];

    for (int i = 1; i < actualGeneration.length - 1; i++) {
      int left = actualGeneration[i-1];
      int middle = actualGeneration[i];
      int right = actualGeneration[i+1];

      int newState = rules(left, middle, right);
      nextGeneration[i] = newState;
    }
    
    return nextGeneration;
  }

  int rules(int left, int middle, int right) {
    if (left == 1 && middle == 1 && right == 1) return ruleSet[0];
    else if (left == 1 && middle == 1 && right == 0) return ruleSet[1];
    else if (left == 1 && middle == 0 && right == 1) return ruleSet[2];
    else if (left == 1 && middle == 0 && right == 0) return ruleSet[3];
    else if (left == 0 && middle == 1 && right == 1) return ruleSet[4];
    else if (left == 0 && middle == 1 && right == 0) return ruleSet[5];
    else if (left == 0 && middle == 0 && right == 1) return ruleSet[6];
    else if (left == 0 && middle == 0 && right == 0) return ruleSet[7];
    else return 0;
  }
}
