Cell[][] cells;

int cols, rows;
int resolution = 10;

int[][] board;

void setup() {
  fullScreen();

  cols = width/resolution;
  rows = height/resolution;

  board = new int[cols][rows];
  cells = new Cell[cols][rows];

  for (int i = 1; i < cols - 1; i++) {
    for (int j = 1; j < rows - 1; j++) {
      float probabilityOfLive = random(1);
      int initialState_;
      
      if (probabilityOfLive <= 0.2) /* => */ initialState_ = 1;
      else /* => */ initialState_ = 0;

      cells[i][j] = new Cell(new PVector(i*resolution, j*resolution), initialState_);
    }
  }
}

void draw() {
  background(255);;

  for (int i = 1; i < cols - 1; i++) {
    for (int j = 1; j < rows - 1; j++) {
      board[i][j] = cells[i][j].state;
    }
  }
  
  for (int i = 1; i < cols - 1; i++) {
    for (int j = 1; j < rows - 1; j++) {
      cells[i][j].run(neighborsAlive(board, i, j));
    }
  }
}

int neighborsAlive(int[][] grid, int i, int j) {
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
