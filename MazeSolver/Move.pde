class Move {
  int row;
  int col;
  color c;
  
  Move(int row, int col, color c) {
    this.row = row;
    this.col = col;
    this.c = c;
  }
  
  Move(Move another) {
    this(another.row, another.col, another.c);
  }
  
  String toString() {
    return str(row) + "," + str(col) + " (" + red(c) + "," + green(c) + "," + blue(c) + ")";
  }
}
