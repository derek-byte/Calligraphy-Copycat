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

PVector getCenterObject(PVector[] arr) {
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
  
  return new PVector(int((minXCoord+maxXCoord)/2), int((minYCoord+maxYCoord)/2));
  
  // Use this for both the teacher and student class. 
  //return 
  
  //int xRange = int(maxXCoord - minXCoord);
  //int yRange = int(maxYCoord - minYCoord);
  //color[][] teacherArr = new color[xRange][yRange];
  //for (int i=0; i < xRange; i++) {
  //  for (int j=0; j < yRange; j++) {
  //    //teacherA
  //  }
  //}
  
}
