color[][] txtToArray(float[] t, PVector[] txtArr) {
  int xLength = int(t[3] - t[1]);
  int yLength = int(t[2] - t[0]);
  
  color[][] arr = new color[xLength+1][yLength+1]; 
  for (int i=0; i < txtArr.length; i++) {
    int x = int(txtArr[i].x - t[1]);
    int y = int(txtArr[i].y - t[0]);
    
    arr[x][y] = tracerGrey;
  }
  
  return arr;
}

void setMaxScore(/*String letter*/) {
  // Show red and green to show the similarities and differences
  PVector[] template = getTxtFile("Teacher/"+board.letter+".txt");
  PVector[] studentDrawing = getTxtFile("Student/"+board.letter+".txt");
  
  float[] t = getBoxBoundaries(template);
  float[] s = getBoxBoundaries(studentDrawing);
  
  color[][] teacher = txtToArray(t, template);
  color[][] student = txtToArray(s, studentDrawing);
  
  int overlappingPixels = 0;
  for (int i=0; i < max(int(t[3] - t[1]), int(s[3] - s[1])); i++) {
    for (int j=0; j < max(int(t[2] - t[0]), int(s[2] - s[0])); j++) {
      try {
        if (teacher[i][j] == student[i][j]) {
          overlappingPixels++;
          //board.cellsNext[i][j] = color(0, 255, 0);
        } else {
          //board.cellsNext[i][j] = color(255, 0, 0);
        }
      } catch (IndexOutOfBoundsException e) {}
    }
  }
  
  int xLength = int(t[3] - t[1])+1;
  int yLength = int(t[2] - t[0])+1;
  float score = overlappingPixels * 100.00 / (xLength*yLength);
  board.maxScore = score;
}


int findOverlappingPixels(PVector[] template, PVector[] studentDrawing, int x, int y/*String letter*/) {
  int overlap = 0;
  for (int i = x; i < board.n; i++) {
    for (int j = y; j < board.n; j++) {
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
