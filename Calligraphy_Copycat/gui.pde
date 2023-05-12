/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.
 
 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
 // It is safe to enter your event code here
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void createHomePage() {
    studentButton = new GButton(this, 206, 274, 100, 30);
    studentButton.setText("Student");
    studentButton.addEventHandler(this, "studentMode");
    teacherButton = new GButton(this, 206, 342, 100, 30);
    teacherButton.setText("Teacher");
    teacherButton.addEventHandler(this, "teacherMode");
    instructionButton = new GButton(this, 460, 471, 40, 30);
    instructionButton.setText("?");
    instructionButton.addEventHandler(this, "instructionButtonPressed");
}

public void deleteHomePage() {
  studentButton.dispose();
  teacherButton.dispose();
  instructionButton.dispose();
}

public void studentMode(GButton source, GEvent event) { //_CODE_:studentButton:712179:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  board.isDrawing = true;
  win_draw1();
  deleteHomePage();
  background(0);
} //_CODE_:studentButton:712179:

public void teacherMode(GButton source, GEvent event) { //_CODE_:teacherButton:875382:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  board.isDrawing = true;
  win_draw2();
  deleteHomePage();
  background(0);
} //_CODE_:teacherButton:875382:

public void instructionButtonPressed(GButton source, GEvent event) { //_CODE_:instructionButton:227920:
  println("instructionButton - GButton >> GEvent." + event + " @ " + millis());
  if (title == true) {
    instructionsPage();
    title = false;
  } else if (title == false) {
    loop();
    title = true;
  }
} //_CODE_:instructionButton:227920:

synchronized public void win_draw1() { //_CODE_:studentWindow:951950:
  studentWindow = GWindow.getWindow(this, "StudentMode", 0, 0, 250, 300, JAVA2D);
  studentWindow.noLoop();
  studentWindow.setActionOnClose(G4P.CLOSE_WINDOW);
  studentWindow.addDrawHandler(this, "win_draw1");
  letterList = new GDropList(studentWindow, 5, 22, 89, 140, 6, 10);
  letterList.setItems(loadStrings("list_635450"), 0);
  letterList.addEventHandler(this, "letterSelected");
  colourList = new GDropList(studentWindow, 111, 24, 90, 140, 6, 10);
  colourList.setItems(loadStrings("list_944983"), 0);
  colourList.addEventHandler(this, "colourSelected");
  clearButton = new GButton(studentWindow, 6, 188, 80, 30);
  clearButton.setText("Clear");
  clearButton.addEventHandler(this, "clearButtonPressed");
  Submit = new GButton(studentWindow, 103, 188, 80, 30);
  Submit.setText("Submit");
  Submit.addEventHandler(this, "submitButtonPressed");
  backToMain = new GButton(studentWindow, 168, 269, 80, 30);
  backToMain.setText("Back to Menu");
  backToMain.addEventHandler(this, "backToMainPressed");
  studentWindow.loop();
} //_CODE_:studentWindow:951950:

public void letterSelected(GDropList source, GEvent event) { //_CODE_:letterList:635450:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:letterList:635450:

public void colourSelected(GDropList source, GEvent event) { //_CODE_:colourList:944983:
  println("colourList - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:colourList:944983:

public void clearButtonPressed(GButton source, GEvent event) { //_CODE_:clearButton:330661:
  println("clearButton - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:clearButton:330661:

public void submitButtonPressed(GButton source, GEvent event) { //_CODE_:Submit:288597:
  println("Submit - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:Submit:288597:

public void backToMainPressed(GButton source, GEvent event) { //_CODE_:backToMain:279625:
  println("backToMain - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:backToMain:279625:

synchronized public void win_draw2() { //_CODE_:teacherWindow:386192:
  teacherWindow = GWindow.getWindow(this, "Teacher Mode", 0, 0, 250, 300, JAVA2D);
  teacherWindow.noLoop();
  teacherWindow.setActionOnClose(G4P.KEEP_OPEN);
  teacherWindow.addDrawHandler(this, "win_draw2");
  letterListTeach = new GDropList(teacherWindow, 9, 19, 90, 140, 6, 10);
  letterListTeach.setItems(loadStrings("list_826108"), 0);
  letterListTeach.addEventHandler(this, "letterTeacherSelect");
  teacherClear = new GButton(teacherWindow, 13, 181, 80, 30);
  teacherClear.setText("Clear");
  teacherClear.addEventHandler(this, "teacherClearedPressed");
  makeTemplate = new GButton(teacherWindow, 15, 228, 80, 30);
  makeTemplate.setText("Make Template");
  makeTemplate.addEventHandler(this, "makeTemplatePressed");
  backToMainTwo = new GButton(teacherWindow, 169, 269, 80, 30);
  backToMainTwo.setText("Back to Menu");
  backToMainTwo.addEventHandler(this, "backToMainTwoPressed");
  teacherWindow.loop();
} //_CODE_:teacherWindow:386192:

public void letterTeacherSelect(GDropList source, GEvent event) { //_CODE_:letterListTeach:826108:
  println("letterListTeach - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:letterListTeach:826108:

public void teacherClearedPressed(GButton source, GEvent event) { //_CODE_:teacherClear:447221:
  println("teacherClear - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:teacherClear:447221:

public void makeTemplatePressed(GButton source, GEvent event) { //_CODE_:makeTemplate:495839:
  println("makeTemplate - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:makeTemplate:495839:

public void backToMainTwoPressed(GButton source, GEvent event) { //_CODE_:backToMainTwo:517947:
  println("backToMainTwo - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:backToMainTwo:517947:



// Create all the GUI controls.
// autogenerated do not edit
public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  createHomePage();
}

// Variable declarations
// autogenerated do not edit
GButton studentButton;
GButton teacherButton;
GButton instructionButton;
GWindow studentWindow;
GDropList letterList;
GDropList colourList;
GButton clearButton;
GButton Submit;
GButton backToMain;
GWindow teacherWindow;
GDropList letterListTeach;
GButton teacherClear;
GButton makeTemplate;
GButton backToMainTwo;
