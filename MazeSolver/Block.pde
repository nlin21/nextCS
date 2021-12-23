class Block {
  float x, y, w, h;
  int type;
  color c;
  
  Block(float x, float y, float w, float h, int type, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.type = type;
    this.c = c;
  }
  
  void display() {
    fill(c);
    rect(x, y, w, h);
  }
}
