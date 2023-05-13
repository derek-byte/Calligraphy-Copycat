

//float findMaxScore(String letter /*String letter*/) {
//  PVector[] template = getTxtFile();
//  PVector[] studentDrawing = getTxtFile();
//  float score = (overlap) / template.length) * 100;
//  return score;
//}

//int findOverlappingPixels(/*String letter*/) {
//  int overlap = 0;
//  PVector[] template = getTxtFile();
//  PVector[] studentDrawing = getTxtFile();
//  for (int i = 0; i < template.length; i++) {
//    for (int j = 0; j < studentDrawing.length; j++) {
//      if (studentDrawing.j = template.i) {
//        overlap++;
//      }
//    }
//  }
//  return overlap;
//}

void handleSubmit() {
  board.uploadData();
}

PVector[] getTxtFile() {
  printWriter.close();
  
  String[] lines = loadStrings("data.txt");
  int numPoints = lines.length;
  
  drawnPoints = new PVector[ numPoints ];
  
  for (int i=0; i < numPoints; i++ ) {
    String[] xyVals = lines[i].split(",");
    drawnPoints[i] = new PVector();
    drawnPoints[i].x = int(xyVals[0]);
    drawnPoints[i].y = int(xyVals[1]);
  }
  
  fill(255,0,0);
  
  printWriter = createWriter("data.txt");
  
  return drawnPoints;
}
