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
}
