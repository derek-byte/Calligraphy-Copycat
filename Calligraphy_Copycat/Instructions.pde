void instructionsPage() { //Draws the instructions page
  background(bg);
  fill(78, 90, 128);
  textAlign(CENTER);
  textSize(40);
  text("Instructions", width/2, 150 );
  textSize(15);
  text("Click teacher to create templates for students to follow", width/2, 170);
  text("Click student to follow templates created by your teacher", width/2, 190);
  text("Click ? to return to selection", width/2, 210);
  noLoop();
}

void titlePage() { //Draws the logo
  if(title == true) {
   bg = color(214, 196, 135);

   logo = loadImage("calligraphycopycat.png");
   image(logo, 125, 75);
   noStroke();
  }
}
