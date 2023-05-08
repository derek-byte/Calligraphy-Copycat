void copyNextGenerationToCurrentGeneration() {
  for (int i = 0; i < n; i++) 
    for (int j = 0; j < n; j++) {
      cells[i][j] = cellsNext[i][j];
    }
}

void setCellValues(int x, int y) {
  try {
    cellsNext[x][y] = cells[x][y];
  } catch (IndexOutOfBoundsException e) {}
}
