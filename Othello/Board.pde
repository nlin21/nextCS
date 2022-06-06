color GREEN = color(60,179,113);
int TURN = 1;

class Board {
  
  Disc[][] board;
  color turn;
  
  Board() {
    int x = 125;
    int y = 125;
    board = new Disc[8][8];
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        board[i][j] = new Disc(x + 50 * i, y + 50 * j, BLANK);
      }
    }
    board[3][3].c = BLACK; 
    board[3][4].c = WHITE;
    board[4][3].c = WHITE;
    board[4][4].c = BLACK;
  }
  
  void display() {
    rectMode(CORNERS);
    stroke(0);
    strokeWeight(2);
    fill(BLACK);
    rect(75,75,525,525,30,30,30,30);
    fill(GREEN);
    rect(100,100,500,500,25,25,25,25);
    for (int i = 150; i <= 500; i += 50) {
      line(i,100,i,500);
    }
    for (int i = 150; i <= 500; i += 50) {
      line(100,i,500,i);
    }
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        board[i][j].display();
      }
    }
  }
  
  void placeDisc(int x, int y) {
    if (TURN % 2 == 1) {
      turn = BLACK;
    } else {
      turn = WHITE;
    }
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if ((abs(board[i][j].x - x) < 25) && 
            (abs(board[i][j].y - y) < 25) && 
            (board[i][j].c == BLANK)) {
              board[i][j].c = turn;
              checkLeft(i,j);
              TURN++;
            }
      }
    }
  }
  
  void checkLeft(int x, int y) {
    boolean legal = false;
    int h = -1;
    for (int i = x-1, j = y; i >= 0; i--) {
      if (board[i][j].c == turn) {
        legal = true;
        h = i;
        break;
      }
    }
    println(legal);
    if (legal) {
      for (int i = x-1, j = y; i != h; i--) {
        board[i][j].flip();
      }
    }
  }
  
  
  
}
