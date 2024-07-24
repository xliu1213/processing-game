class ComputerPlayer extends Player {
  ComputerPlayer(int screen_y) {
    super(screen_y);
    paddlecolor = color(150);
  }
  
  void move(float ball_x) {
    if (xpos > SCREENX - PADDLEWIDTH) {
      xpos = SCREENX - PADDLEWIDTH;
    }
    if (xpos + PADDLEWIDTH / 2 < ball_x) {
      xpos = xpos + 2;
    } else if (xpos + PADDLEWIDTH / 2 > ball_x) {
      xpos = xpos - 2;
    }
  }
}
