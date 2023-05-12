

float findMaxScore(/*String letter*/) {
  PVector[] template = getTxtFile();
  PVector[] studentDrawing = getTxtFile();
  float score = (overlap) / template.length) * 100;
  return score;
}

int findOverlappingPixels(/*String letter*/) {
  int overlap = 0;
  PVector[] template = getTxtFile();
  PVector[] studentDrawing = getTxtFile();
  for (int i = 0; i < template.length; i++) {
    for (int j = 0; j < studentDrawing.length; j++) {
      if (studentDrawing.j = template.i) {
        overlap++;
      }
    }
  }
  return overlap;
}

void handleSubmit() {
  board.uploadData();
}
