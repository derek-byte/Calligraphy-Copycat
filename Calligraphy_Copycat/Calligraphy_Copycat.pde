import g4p_controls.*;

//Calligraphy Copycat by Derek, Isabela & Grace

//Calligraphy Copycat logo
PImage logo;

//Pen color options
color black = color(0); // This is not used for dropdown
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color white = color(255);
color grey = color(150, 150, 150);
color purple = color(212, 0, 255);
color pink = color(255, 0, 200);
color orange = color(255, 170, 0);
color yellow = color(255, 230, 0);
color teal = color(0, 255, 195);
color tracerGrey = color(155);
color bg = color(214, 196, 135);

boolean title = true; //If the user is on the title page
DrawingBoard board;
PrintWriter printWriter;
PVector[] drawnPoints;
String userType;

void setup() {
  size(500, 500);
  
  //creates the drawing board
  board = new DrawingBoard();
  board.setInitialValues();
  
  createGUI();
}

void draw() {
  background(bg);   
  
  titlePage();
  
  //updates the drawing board at the frame rate, only in drawing mode
  if (board.isDrawing) {
    board.updateDrawingBoard();
    board.showStats();
    bg = color(0);
  } 
}
