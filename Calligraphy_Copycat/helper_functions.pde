// Converts the txt file points to an array
color[][] txtToArray(float[] t, PVector[] txtArr) { 
  int xLength = int(t[3] - t[1])+1; // x length of array
  int yLength = int(t[2] - t[0])+1; // y length of array
  
  // Adding file points to array
  color[][] arr = new color[xLength][yLength]; 
  for (int i=0; i < txtArr.length; i++) {
    int x = int(txtArr[i].x - t[1]);
    int y = int(txtArr[i].y - t[0]);
    
    arr[x][y] = white;
  }
  
  return arr;
}

void setMaxScore() {
  // Gets the points from the txt file as PVectors 
  PVector[] template = getTxtFile("Teacher/"+board.letter+".txt");
  PVector[] studentDrawing = getTxtFile("Student/"+board.letter+".txt");
  
  if (template.length != 0 && studentDrawing.length != 0) {
    // Gets the xMin, yMin, xMax, and yMax values 
    float[] t = getBoxBoundaries(template);
    float[] s = getBoxBoundaries(studentDrawing);
    
    // Teacher and student box arrays
    color[][] teacher = txtToArray(t, template);
    color[][] student = txtToArray(s, studentDrawing);
    
    // Find overlapping pixels between teacher and student arrays 
    int overlappingPixels = 0;
    for (int i=0; i < max(int(t[3] - t[1]), int(s[3] - s[1])); i++) {
      for (int j=0; j < max(int(t[2] - t[0]), int(s[2] - s[0])); j++) {
        try {
          if (teacher[i][j] == student[i][j]) {
            overlappingPixels++;
          }
        } catch (IndexOutOfBoundsException e) {}
      }
    }
    
    // Get the total pixels compared & denominator 
    int totalPixels = max(int(t[3] - t[1]), int(s[3] - s[1]) * max(int(t[2] - t[0]), int(s[2] - s[0])));
    // Get percent value of how many pixels overlap
    float score = overlappingPixels * 100.00/totalPixels ;
    board.maxScore = score;
  } else {
    // If nothing is drawn or the teacher template does not exist, score is 0
    board.maxScore = 0;
  }
}

void handleSubmit() {
  // Upload student board drawing to .txt
  board.uploadData();
  // Get max score
  setMaxScore();
}

PVector[] getTxtFile(String file) {
  // Retrieve points in the .txt file
  String[] lines = loadStrings(file);
  int numPoints = lines.length;
  
  // Save coordinates as PVectors
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
  // Getting the edges of the drawing to create the boundaries of the box
  float minYCoord = arr[0].y;
  float minXCoord = arr[0].x;
  float maxYCoord = arr[0].y;
  float maxXCoord = arr[0].x;
  
  // Get the minX, minY, maxX, maxY values
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
  // Centers the tracer/object to the center of the board
  float[] b = getBoxBoundaries(arr);
  return new PVector(int((b[1]+b[3])/2), int((b[0]+b[2])/2));
}
