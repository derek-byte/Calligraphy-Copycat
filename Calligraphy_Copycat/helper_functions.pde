

float findMaxScore(String letter) {
  PVector[] template =
  float score = (overlap(letter) / template.length) * 100;
  return score;
}

int findOverlappingPixels(String letter) {
  int overlap = 0;
  PVector[] template =
  PVector[] studentDrawing =
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
  println("HI");
}
