color WHITE = color(255);
color BLACK = color(0);
color BLANK = color(1,1,1,0);

class Disc {
  
  int x, y;
  color c;
  
  Disc(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    if (c == BLANK) {
      noStroke();
    }
    fill(c);
    circle(x, y, 35);
  }
  
  void flip() {
    if (c == WHITE) {
      c = BLACK;
    } else {
      c = WHITE;
    }
  }
  
}
