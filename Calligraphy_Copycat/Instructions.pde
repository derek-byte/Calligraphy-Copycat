void instructionsPage() {
  background(0);
  fill(250);
  textAlign(CENTER);
  textSize(40);
  text("Instructions", width/2, 150 );
  textSize(15);
  text("Click teacher to create templates for students to follow", width/2, 170);
  text("Click student to follow templates created by your teacher", width/2, 190);
  noLoop();
}

void titlePage() {
  if(title == true) {
   noStroke();
   textSize(40);
   fill(255);
   textAlign(CENTER);
   text("Calligraphy Copycat", width/2, 150 );
   textSize(30); 
  }
}
