class DrawingBoard {
  int n;
  color[][] cells;  
  color[][] cellsNext;
  float cellSize;
  float cellSizeY;
  
  color markerColor;
  boolean isDrawing;
  boolean uploadData;
  
  DrawingBoard() {
    this.n = 100;    
    this.cells = new color[this.n][this.n];         
    this.cellsNext = new color[this.n][this.n];
    this.cellSize = 500.0/this.n;  
    this.cellSizeY = 500.0/this.n;
    this.markerColor = color(255);
    this.isDrawing = false;
    this.uploadData = false;
  }
  
  void clearDrawingBoard() {
    this.cellsNext = new color[this.n][this.n]; 
  }
  
  void updateDrawingBoard() {
    clearDrawingBoard();
    for (int i = 0; i < this.n; i++ ) {
      for (int j = 0; j < this.n; j++) {
        float x = i*this.cellSizeY; 
        float y = j*this.cellSizeY;    
  
        fill(this.cells[i][j]);
        square(x, y, this.cellSizeY); 
  
        setCellValues(i, j);
      }
    }
    copyNextGenerationToCurrentGeneration();
  }
  
  void copyNextGenerationToCurrentGeneration() {
    for (int i = 0; i < this.n; i++) 
      for (int j = 0; j < this.n; j++) {
        this.cells[i][j] = this.cellsNext[i][j];
      }
  }

  void setCellValues(int x, int y) {
    try {
      this.cellsNext[x][y] = this.cells[x][y];
    } catch (IndexOutOfBoundsException e) {}
  }
  
  void uploadData() {
    for (int i = 0; i < this.n; i++) 
      for (int j = 0; j < this.n; j++) {
        printWriter.println( i + "," + j );
      }
    printWriter.close();
  }
}
