void setMaxScore(/*String letter*/) {
  // Show red and green to show the similarities and differences
  PVector[] template = getTxtFile("Teacher/"+board.letter+".txt");
  PVector[] studentDrawing = getTxtFile("Student/"+board.letter+".txt");
  
  float[] t = getBoxBoundaries(template);
  float[] s = getBoxBoundaries(studentDrawing);
  
  int maxOverlappingPixels = 0;
  for (int i=0; i < board.n-t[3]; i++) {
    for (int j=0; j < board.n-t[2]; j++) {
      println(i, j);
      int overlappingPixels = findOverlappingPixels(template, studentDrawing, i, j);
      if (overlappingPixels > maxOverlappingPixels) {
        println("AHHHHHHH", i, j);
        maxOverlappingPixels = overlappingPixels;
      }
    }
  }
  
  //maxOverlappingPixels = findOverlappingPixels(template, studentDrawing, i, j);
  println("MAX OVERLAPING", maxOverlappingPixels);
  float score = (maxOverlappingPixels / template.length) * 100;
  board.maxScore = score;
  println("SCORE", score);
}

int findOverlappingPixels(PVector[] template, PVector[] studentDrawing, int x, int y/*String letter*/) {
  int overlap = 0;
  for (int i = x; i < board.n; i++) {
    for (int j = y; j < board.n; j++) {
      println(studentDrawing[j], template[i]);
      if (studentDrawing[j].x == template[i].x+x && studentDrawing[j].y == template[i].y+y) {
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

float[] getBoxBoundaries(PVector[] arr) {
  float minYCoord = arr[0].y;
  float minXCoord = arr[0].x;
  float maxYCoord = arr[0].y;
  float maxXCoord = arr[0].x;
  
  for (int i=0; i<arr.length; i++) {
    if (arr[i].x < minXCoord) {
      minXCoord = arr[i].x;
    } else if (arr[i].x > maxXCoord) {
      maxXCoord = arr[i].x;
    }
    if (arr[i].y < minYCoord) {
      minYCoord = arr[i].y;
    } else if (arr[i].y > maxYCoord) {
      maxYCoord = arr[i].y;
    }
  }
  
  float[] ans = {minYCoord, minXCoord, maxYCoord, maxXCoord};
  return ans;
}

PVector getCenterObject(PVector[] arr) {
  float[] b = getBoxBoundaries(arr);
  return new PVector(int((b[1]+b[3])/2), int((b[0]+b[2])/2));
}

//void boxAroundObject(PVector[] arr) {
//  float[] b = getBoxBoundaries(arr);
  
//}
