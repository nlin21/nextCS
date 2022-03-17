class Key {
  
  int x, y, w, h;
  char character;
  
  Key(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display() {
    fill(150);
    rect(x,y,w,h,10,10,10,10);
    fill(255);
    text(character, x + w/2, y + h/2 + 10);
  } 
  
  void recolor(color c) {
    fill(c);
    stroke(c);
    rect(x,y,w,h,10,10,10,10);
    fill(255);
    text(character, x + w/2, y + h/2 + 10);
  }
  
}
