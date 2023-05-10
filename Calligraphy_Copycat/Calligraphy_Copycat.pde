import g4p_controls.*;

//Calligraphy Copycat by Derek, Isabela & Grace

DrawingBoard board;
PrintWriter printWriter;
PVector[] drawnPoints;

void setup() {
  size(500, 500);
  
  board = new DrawingBoard();
  printWriter = createWriter("data.txt");
}

void draw() {
  background(0);   
  
  //TITLE PAGE
  noStroke();
  textSize(40);
  fill(255);
  textAlign(CENTER);
  text("Calligraphy Copycat", width/2, 150 );
  textSize(30);
  
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
