void instructionsPage() { //Draws the instructions page
  background(bg);
  fill(78, 90, 128);
  textAlign(CENTER);
  textSize(40);
  text("Instructions", width/2, 150 );
  textSize(13);
  text("Calligraphy Copycat is an educational software designed to", width/2, 190);
  text("improve student handwriting. Users can create example fonts", width/2, 210);
  text("in Teacher Mode and these examples can then be traced in Student Mode.", width/2, 230);
  text("In Student Mode users will be given a score based on their accuracy", width/2, 250);
  text("to the example letters created by the teacher.", width/2, 270);
  textSize(13);
  text("Click teacher to create templates for students to follow", width/2, 310);
  text("Click student to follow templates created by your teacher", width/2, 330);
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
