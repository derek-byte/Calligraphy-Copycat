import g4p_controls.*;

//Calligraphy Copycat by Derek, Isabela & Grace

int n = 100;
color[][] cells;  
color[][] cellsNext;
float cellSize;
float cellSizeY;

color markerColor = color(255);
boolean isDrawing = false;

void setup() {
  size(500, 500);
  
  cellSize = width/n;  
  cellSizeY = height/n;
  cells = new color[n][n];         
  cellsNext = new color[n][n];
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
  
  //CREATE GUI
  createGUI();
  
  if (isDrawing)
    updateDrawingBoard();
}
