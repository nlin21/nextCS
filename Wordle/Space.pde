class Space {
  
  int x, y;
  String s;
  color c;
  
  Space(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    rect(x,y,60,60);
  }
  
  void enter(String letter) {
    fill(0);
    stroke(150);
    display();
    fill(255);
    text(letter.toUpperCase(), 160 + 70*position, 50 + 70*guess);
    s = letter;
    position++;
  }
  
  void delete() {
    fill(0);
    stroke(75);
    rect(130 + 70*(position-1), 10 + 70*guess, 60, 60);
    s = " ";
    position--;
  }
  
  void recolor(color col) {
    c = col;
    fill(col);
    stroke(col);
    display();
    fill(255);
    text(s.toUpperCase(), x+30, y+40);
  }
  
}
