import g4p_controls.*;

//Calligraphy Copycat by Derek, Isabela & Grace

DrawingBoard board = new DrawingBoard();

void setup() {
  size(500, 500);
}

void draw() {
  background(0);   
  
  //TITLE PAGE
  noStroke();
  fill(148, 148, 156);
  textSize(40);
  fill(0);
  textAlign(CENTER);
  text("Calligraphy Copycat", width/2, 150 );
  textSize(30);
  
  if (board.isDrawing) {
    board.updateDrawingBoard();
  } else {
    //CREATE GUI
    createGUI();
  }
}
