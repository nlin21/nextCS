Board board;

void setup() {
  size(600,600);
  board = new Board();
}

void draw() {
  background(200);
  board.display();
  fill(255);
  textSize(30);
  text("Turn " + TURN, 25, 40);
}

void mousePressed() {
  board.placeDisc(mouseX, mouseY);
}
