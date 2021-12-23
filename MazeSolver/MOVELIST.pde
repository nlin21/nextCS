class MOVELIST {
  Move[] moves;
  int filled;
  
  MOVELIST(int initSize) {
    moves = new Move[initSize];
    filled = 0;
  }
  
  Move get(int index) {
    if (index < 0 || index >= filled) {
      return null;
    }
    return moves[index];
  }
  
  void append(int row, int col, color c) {
    if (filled < moves.length) {
      moves[filled] = new Move(row,col,c);
      ++filled;
      return;
    }
    
    Move[] newMoves = new Move[moves.length * 2];
    for (int i = 0; i < moves.length * 2; ++i) {
      if (i < filled) {
        newMoves[i] = moves[i];
      }
    }
    moves = newMoves;
    
    this.append(row,col,c);
  }
}
