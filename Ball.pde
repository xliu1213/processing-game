class Ball {
  float x; float y; float dx; float dy;
  int radius; color ballColor = color(200, 100, 50);
  
  Ball() {
    reset();
  }
  
  void reset() {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(2, 3); dy = random(2, 3);
    radius = 5;
  }
  
  void draw() {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }
  
  void collide(Player tp) {
    if (y + radius >= tp.ypos &&
        y - radius < tp.ypos + PADDLEHEIGHT &&
        x >= tp.xpos &&
        x <= tp.xpos + PADDLEWIDTH) {
      dy = -dy;
    }
  }
  
  boolean checkGameOver() {
    if (thePlayer.wins >= 3 || theComputerPlayer.wins >= 3) {
      gameRunning = false;
      noLoop();
      displayGameOverMessage();
      return true;
    }
    return false;
  }
  
  void move() {
    x = x + dx;
    y = y + dy;
    
    if (x - radius <= 0 || x + radius >= SCREENX) {
      dx = -dx;
    }
    if (y - radius <= 0) {
      thePlayer.incrementWins();
      if (checkGameOver()) {
        return;
      }
      reset();
    } else if (y + radius >= SCREENY) {
      theComputerPlayer.incrementWins();
      if (checkGameOver()) {
        return;
      }
      reset();
    }
  }
}
