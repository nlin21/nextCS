char[] letters1 = new char[]{'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'};
char[] letters2 = new char[]{'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'};
char[] letters3 = new char[]{char(60), 'Z', 'X', 'C', 'V', 'B', 'N', 'M', char(8)};
  
class Keyboard {
  
  Key[] row1;
  Key[] row2;
  Key[] row3;  
  
  Keyboard() {
    row1 = new Key[10];
    row2 = new Key[9];
    row3 = new Key[9];
    
    for (int i = 0; i < row1.length; i++) {
      row1[i] = new Key(25 + 55*i, 450, 50, 60);
      row1[i].character = letters1[i];
      row1[i].display();
    }
    
    for (int i = 0; i < row2.length; i++) {
      row2[i] = new Key(52 + 55*i, 515, 50, 60);
      row2[i].character = letters2[i];
      row2[i].display();
    }
    
    for (int i = 1; i < row3.length-1; i++) {
      row3[i] = new Key(52 + 55*i, 580, 50, 60);
      row3[i].character = letters3[i];
      row3[i].display();
    }
    row3[0] = new Key(32, 580, 70, 60);
    row3[0].character = letters3[0];
    row3[0].display();
    row3[row3.length-1] = new Key(492, 580, 70, 60);
    row3[row3.length-1].character = letters3[row3.length-1];
    row3[row3.length-1].display();
  }
   
}
