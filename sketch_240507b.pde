Player thePlayer;
ComputerPlayer theComputerPlayer;
Ball theBall;
boolean gameRunning = false;
PFont impactFont, displayLivesFont;

void settings(){
  size(SCREENX, SCREENY);
}

void setup(){
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT-25);
  theComputerPlayer = new ComputerPlayer(MARGIN+25);
  theBall = new Ball();
  ellipseMode(RADIUS);
  impactFont = loadFont("Impact-25.vlw");
  displayLivesFont = loadFont("BerlinSansFB-Bold-20.vlw");
  textAlign(CENTER, CENTER);
  noLoop();
}

void draw() {
  background(0);
  if (gameRunning) {
    theBall.move();
    thePlayer.move(mouseX);
    theComputerPlayer.move(theBall.x);
    theBall.collide(thePlayer);
    theBall.collide(theComputerPlayer);
    theBall.draw();
    thePlayer.draw();
    theComputerPlayer.draw();
    displayLives();
  } else {
    displayGameOverMessage();
  }
}

void mousePressed() {
  if (!gameRunning) {
    resetGame();
  }
}

void resetGame() {
  gameRunning = true;
  thePlayer.wins = 0;
  theComputerPlayer.wins = 0;
  theBall.reset();
  loop();
}

void displayGameOverMessage() {
  textFont(impactFont);
  if (thePlayer.wins >= 3) {
    fill(0, 255, 0);
    text("Game Over! Player Wins!", SCREENX / 2, SCREENY / 2);
  } else if (theComputerPlayer.wins >= 3) {
    fill(255, 0, 0);
    text("Game Over! Computer Wins!", SCREENX / 2, SCREENY / 2);
  } else {
    fill(255);
    text("Click to Start the Game", SCREENX / 2, SCREENY / 2);
  }
}

void displayLives() {
  fill(255);
  textFont(displayLivesFont);
  fill(255, 165, 0);
  text("Player Wins: " + thePlayer.wins, SCREENX / 2, SCREENY - MARGIN - 5);
  text("Computer Wins: " + theComputerPlayer.wins, SCREENX / 2, MARGIN + 5);
}
