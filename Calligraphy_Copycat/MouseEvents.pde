void mouseDragged() {
  if (board.isDrawing && title) {
    int col = int(mouseX/board.cellSize);
    int row = int(mouseY/board.cellSize);
    
    // Updates the drawing board using the marker colour 
    try {
      board.cellsNext[col][row] = board.markerColor;
    } catch (IndexOutOfBoundsException e) {}
    
    board.copyNextGenerationToCurrentGeneration();
  }
}
