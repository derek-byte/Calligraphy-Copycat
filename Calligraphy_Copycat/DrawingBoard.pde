class DrawingBoard {
  //fields
  int n;
  color[][] cells;
  color[][] cellsNext;
  float cellSize;
  float cellSizeY;

  color markerColor;
  boolean isDrawing;
  boolean uploadData;
  boolean isShowTracer;

  String letter;
  float maxScore = 0;

  //constructor method
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
    this.maxScore = 0;
    this.isShowTracer = false;
  }

  //clears the board, used to update board
  void clearDrawingBoard() {
    setInitialValues();
    copyNextGenerationToCurrentGeneration();
    
    if (this.isShowTracer && userType.equals("Student")) {
      showTracer();
    } 
  }
  
  //clears the tracer from the screen, keeps user drawing
  void clearTracer() {
    for (int i=0; i<this.n; i++) {
      for (int j=0; j<this.n; j++) {
        if (cells[i][j] == tracerGrey) {
          cellsNext[i][j] = black;
        }
      }
    }
    copyNextGenerationToCurrentGeneration();
  }
  
  //creates an initial blank board
  void setInitialValues() {
    for (int i = 0; i < this.n; i++ ) {
      for (int j = 0; j < this.n; j++) {
        cells[i][j] = black;
        cellsNext[i][j] = black;
      }
    }
  }

  //shows the letter template on the drawing board
  void showTracer() {
    PVector[] teacherArr = getTxtFile("Teacher/"+this.letter+".txt");

    PVector midPoint = getCenterObject(teacherArr);
    int xShift = int(midPoint.x)-int(n/2);
    int yShift = int(midPoint.y) - int(n/2);

    for (int i=0; i<teacherArr.length; i++) {
      cells[int(teacherArr[i].x - xShift)][int(teacherArr[i].y - yShift)] = tracerGrey;
      cellsNext[int(teacherArr[i].x - xShift)][int(teacherArr[i].y - yShift)] = tracerGrey;
    }
  }

  //updates the drawing board, called in draw
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
    }
    catch (IndexOutOfBoundsException e) {
    }
  }

  //uploads data to the text files so that we can keep track of specific letter drawings
  void uploadData() {
    print("UPLOADING DATA", userType+"/"+this.letter+".txt");
    printWriter = createWriter(userType+"/"+this.letter+".txt");
    for (int i = 0; i < this.n; i++)
      for (int j = 0; j < this.n; j++) {
        if (cells[i][j] != black && cells[i][j] != tracerGrey) {
          printWriter.println( i + "," + j );
        }
      }
    printWriter.close();
  }

  void changeColor(color clr) {
    this.markerColor = clr;
  }

  //all of the statistics shown in the top left corner
  void showStats() {
    fill(250);
    textAlign(LEFT);
    textSize(13);
    text("Calligraphy Copycat", 10, 20 );
    textSize(12);
    text("Mode:" + userType, 10, 40 );

    if (userType.equals("Student"))
      text("Score: " + round(this.maxScore) + "%", 10, 60 );
  }

  void markerOutline() {
  }
}
