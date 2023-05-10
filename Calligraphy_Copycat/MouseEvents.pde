void mouseDragged() {
  if (board.isDrawing) {
    int col = int(mouseX/board.cellSize);
    int row = int(mouseY/board.cellSize);
    
    try {
      board.cellsNext[col][row] = board.markerColor;
    } catch (IndexOutOfBoundsException e) {}
    
    board.copyNextGenerationToCurrentGeneration();
  }
}
