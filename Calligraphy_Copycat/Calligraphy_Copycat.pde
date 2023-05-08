float isabela = 4;
//Calligraphy Copycat by Derek, Isabela & Grace
void setup() {
size(500, 500);
}

void draw() {
  //TITLE PAGE
  noStroke();
  fill(148, 148, 156);
  rect(width/2-75, 250, 150, 50);
  rect(width/2-75, 325, 150, 50);
  rect(width-50, height-50, 50, 50);
  textSize(40);
  fill(0);
  textAlign(CENTER);
  text("Calligraphy Copycat", width/2, 150 );
  textSize(30);
  text("Teacher", width/2, 285 );
  text("Student", width/2, 360 );
}
