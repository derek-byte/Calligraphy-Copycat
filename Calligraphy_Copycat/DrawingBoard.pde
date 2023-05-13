class DrawingBoard {
  int n;
  color[][] cells;  
  color[][] cellsNext;
  float cellSize;
  float cellSizeY;
  
  color markerColor;
  boolean isDrawing;
  boolean uploadData;
  
  String letter;
  
  DrawingBoard() {
    this.n = 100;    
    this.cells = new color[this.n][this.n];         
    this.cellsNext = new color[this.n][this.n];
    this.cellSize = 500.0/this.n;  
    this.cellSizeY = 500.0/this.n;
    this.markerColor = color(255);
    this.isDrawing = false;
    this.uploadData = false;
    this.letter = "A";
  }
  
  void clearDrawingBoard() {
    setInitialValues();
    copyNextGenerationToCurrentGeneration();
  }
  
  void setInitialValues() {
    for (int i = 0; i < this.n; i++ ) {
      for (int j = 0; j < this.n; j++) {
        cells[i][j] = black;
        cellsNext[i][j] = black;
      }
    }
  }
  
  void updateDrawingBoard() {
    this.cellsNext = new color[this.n][this.n];
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
    print("UPLOADING DATA");
    //printWriter.flush();
    print(userType+"/"+this.letter+".txt");
    printWriter = createWriter(userType+"/"+this.letter+".txt");
    for (int i = 0; i < this.n; i++) 
      for (int j = 0; j < this.n; j++) {
        if (cells[i][j] != black) {
          print("HI");
          printWriter.println( i + "," + j );
        }
      }
    printWriter.close();
  }
  
  void changeColor(color clr) {
   this.markerColor = clr;
  }
  
  void showStats() {
    fill(250);
    textAlign(LEFT);
    textSize(13);
    text("Calligraphy Copycat", 10, 20 );
    textSize(12);
    text("Mode:" + userType, 10, 40 );
    text("Score:", 10, 60 );
  }
}
