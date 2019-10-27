class Grid {
  int[][] grid;

  Grid(int[][] grid_) {
    grid = grid_;
  }
  
  void run(){
    updateGrid();
    displayGrid();
  }
  
  void displayGrid() {
    fill(0);
    for (int i = 1; i < cols - 1; i++) {
      for (int j = 1; j < rows - 1; j++) {
        if (grid[i][j] == 1) rect(i*resolution, j*resolution, resolution, resolution);
      }
    }
  }

  void updateGrid() {
    int[][] next = new int[cols][rows];

    for (int i = 1; i < cols - 1; i++) {
      for (int j = 1; j < rows - 1; j++) {
        int neighbors = neighborsAlive(i, j);
        if (checkIfAlive(neighbors, i, j)) next[i][j] = 0;
        else if (checkBirth(neighbors, i, j)) next[i][j] = 1;
        else next[i][j] = grid[i][j];
      }
    }
    grid = next;
  }

  boolean checkIfAlive(int neighborsAlive_, int i, int j) {
    if (neighborsAlive_ >= 4 && grid[i][j] == 1) return true;
    else if (neighborsAlive_ <= 1 && grid[i][j] == 1) return true;
    else return false;
  }
  
  boolean checkBirth(int neighborsAlive_, int i, int j){
    if (neighborsAlive_ == 3 && grid[i][j] == 0) return true;
    else return false;
  }

  int neighborsAlive(int i, int j) {
    int neighborsAlive_ = 0;
    if (grid[i-1][j-1] == 1) neighborsAlive_++;
    if (grid[i][j-1] == 1) neighborsAlive_++;
    if (grid[i+1][j-1] == 1) neighborsAlive_++;

    if (grid[i-1][j] == 1) neighborsAlive_++;
    if (grid[i+1][j] == 1) neighborsAlive_++;

    if (grid[i-1][j+1] == 1) neighborsAlive_++;
    if (grid[i][j+1] == 1) neighborsAlive_++;
    if (grid[i+1][j+1] == 1) neighborsAlive_++;
    return neighborsAlive_;
  }
}
