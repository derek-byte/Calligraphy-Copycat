float findMaxScore(String letter /*String letter*/) {
  PVector[] template = getTxtFile("Teacher/"+letter+".txt");
  PVector[] studentDrawing = getTxtFile("Student/"+letter+".txt");
  
  int maxOverlappingPixels = 0;
  for (int i=0; i < board.n-template.length; i++) {
    for (int j=0; j < board.n-template.length; j++) {
      int overlappingPixels = findOverlappingPixels(template, studentDrawing);
      if (overlappingPixels > maxOverlappingPixels) {
        maxOverlappingPixels = overlappingPixels;
      }
    }
  }
  
  float score = (maxOverlappingPixels / template.length) * 100;
  return score;
}

int findOverlappingPixels(PVector[] template, PVector[] studentDrawing/*String letter*/) {
  int overlap = 0;
  for (int i = 0; i < template.length; i++) {
    for (int j = 0; j < studentDrawing.length; j++) {
      if (studentDrawing[j] == template[i]) {
        overlap++;
      }
    }
  }
  return overlap;
}

void handleSubmit() {
  board.uploadData();
  //board.maxScore = findMaxScore(board.letter);
}

PVector[] getTxtFile(String file) {
  
  String[] lines = loadStrings(file);
  int numPoints = lines.length;
  
  drawnPoints = new PVector[ numPoints ];
  
  for (int i=0; i < numPoints; i++ ) {
    String[] xyVals = lines[i].split(",");
    drawnPoints[i] = new PVector();
    drawnPoints[i].x = int(xyVals[0]);
    drawnPoints[i].y = int(xyVals[1]);
  }
  
  fill(255,0,0);
    
  return drawnPoints;
}
