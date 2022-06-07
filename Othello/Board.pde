color GREEN = color(60,179,113);
int TURN = 1;

class Board {
  
  Disc[][] board;
  color turn, target;
  
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
              if (masterCheck(i,j)) {
                board[i][j].c = turn;
                TURN++;
              }
            }
      }
    }
  }
  
  void setTarget() {
    if (turn == BLACK) {
      target = WHITE;
    } else {
      target = BLACK;
    }
  }
  
  boolean masterCheck(int i, int j) {
    return checkLeft(i,j) || checkRight(i,j) || checkBottom(i,j) || checkTop(i,j);
  }
  
  boolean checkLeft(int i, int j) {
    setTarget();
    if (i < 2) {
      return false;
    }
    for (int h = i-1; board[h][j].c != turn && h-1 >= 0; h--) {
      if (board[h][j].c == BLANK) {
        return false;
      }
      if (board[h][j].c == target && board[h-1][j].c == turn) {
        return true;
      }  
    }
    return false;
  }
  
  boolean checkRight(int i, int j) {
    if (i > 5) {
      return false;
    }
    for (int h = i+1; board[h][j].c != turn && h+1 <= 7; h++) {
      if (board[h][j].c == BLANK) {
        return false;
      }
      if (board[h][j].c == target && board[h+1][j].c == turn) {
        return true;
      }  
    }
    return false;
  }
  
  boolean checkBottom(int i, int j) {
    if (j > 5) {
      return false;
    }
    for (int k = j+1; board[i][k].c != turn && k+1 <= 7; k++) {
      if (board[i][k].c == BLANK) {
        return false;
      }
      if (board[i][k].c == target && board[i][k+1].c == turn) {
        return true;
      }
    }
    return false;
  }
  
  boolean checkTop(int i, int j) {
    if (j < 2) {
      return false;
    }
    for (int k = j-1; board[i][k].c != turn && k-1 >= 0; k--) {
      if (board[i][k].c == BLANK) {
        return false;
      }
      if (board[i][k].c == target && board[i][k-1].c == turn) {
        return true;
      }
    }
    return false;
  }
  
   
}
