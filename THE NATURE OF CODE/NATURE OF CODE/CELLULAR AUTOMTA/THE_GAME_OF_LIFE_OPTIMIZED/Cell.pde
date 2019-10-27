class Cell {
  int state, nextState;
  PVector location;

  Cell(PVector location_, int initialState) {
    state = initialState;
    location = location_.copy();
    
  }
  
  void run(int neighborsAlive_){
    displayCell();
    updateCell(neighborsAlive_);
  }

  void displayCell() {
    noStroke();
    if (state == 0) fill(255);
    if (state == 1) fill(0);
    rect(location.x, location.y, resolution, resolution);
  }

  void updateCell(int neighborsAlive_) {
    int neighbors = neighborsAlive_;
    
    if (checkIfAlive(neighbors)) nextState = 0;
    else if (checkBirth(neighbors)) nextState = 1;
    else nextState = state;

    state = nextState;
  }

  boolean checkIfAlive(int neighborsAlive_) {
    if (neighborsAlive_ >= 4 && state == 1) return true;
    else if (neighborsAlive_ <= 1 && state == 1) return true;
    else return false;
  }

  boolean checkBirth(int neighborsAlive_) {
    if (neighborsAlive_ == 3 && state == 0) return true;
    else return false;
  }
}
