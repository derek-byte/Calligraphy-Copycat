import g4p_controls.*;

//Calligraphy Copycat by Derek, Isabela & Grace

<<<<<<< HEAD
DrawingBoard board = new DrawingBoard();
boolean title = true;
=======
DrawingBoard board;
PrintWriter printWriter;
PVector[] drawnPoints;
>>>>>>> 5e60992854db49df4364c417a62a866c269147e3

void setup() {
  size(500, 500);
  
  board = new DrawingBoard();
  printWriter = createWriter("data.txt");
}

void draw() {
  background(0);   
  
  titlePage();
  
  if (board.isDrawing) {
    board.updateDrawingBoard();
  } else {
    //CREATE GUI
    createGUI();
  }
  
  if (board.uploadData) {
    board.uploadData();
  }
}

void getTxtFile() {
  printWriter.close();
  
  String[] lines = loadStrings("data.txt");
  int numPoints = lines.length;
  
  drawnPoints = new PVector[ numPoints ];
  
  for (int i=0; i < numPoints; i++ ) {
    String[] xyVals = lines[i].split(",");
    drawnPoints[i] = new PVector();
    drawnPoints[i].x = int(xyVals[0]);
    drawnPoints[i].y = int(xyVals[1]);
  }
  
  fill(255,0,0);
  
  printWriter = createWriter("data.txt");
}
