void mouseDragged() {
  if (isDrawing) {
    int col = int(mouseX/cellSize);
    int row = int(mouseY/cellSize);
    
    try {
      cellsNext[col][row] = markerColor;
    } catch (IndexOutOfBoundsException e) {}
    
    copyNextGenerationToCurrentGeneration();
  }
}
