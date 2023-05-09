import g4p_controls.*;

//Calligraphy Copycat by Derek, Isabela & Grace

color[][] cells;  
color[][] cellsNext;
int n = 100;

float cellSize;
float cellSizeY;

color markerColor = color(255);

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

  cellsNext = new color[n][n]; 
  for (int i = 0; i < n; i++ ) {
    for (int j = 0; j < n; j++) {
      float x = i*cellSizeY; 
      float y = j*cellSizeY;    

      fill(cells[i][j]);
      square(x, y, cellSizeY); 

      setCellValues(i, j);
    }
  }
  copyNextGenerationToCurrentGeneration();
}
