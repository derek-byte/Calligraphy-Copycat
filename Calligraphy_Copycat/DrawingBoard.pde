void updateDrawingBoard() {
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
