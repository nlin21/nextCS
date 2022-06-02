Board board;

void setup() {
  size(600,600);
  board = new Board();
}

void draw() {
  background(200);
  board.display();
}

void mousePressed() {
  board.placeDisc(mouseX, mouseY);
}
