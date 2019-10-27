int[][] board;

int cols, rows;
int resolution = 10;

Grid cellularSimulation;

void setup(){
  fullScreen();
  
  cols = width/resolution;
  rows = height/resolution;
  
  board = new int[cols][rows];
  
  for(int i = 1; i < cols - 1; i++){
    for(int j = 1; j < rows - 1; j++){
      float probabilityOfLive = random(1);
      if(probabilityOfLive <= 0.2) /* => */ board[i][j] = 1;
      else /* => */ board[i][j] = 0;
    }
  }
  
  cellularSimulation = new Grid(board);
}

void draw(){
  background(255);
  cellularSimulation.run();
}
