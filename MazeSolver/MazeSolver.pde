String file = "hard-dw.txt";

int rows, columns;
int startrow, startcol;
int idraw;
float bwidth, bheight;

int WALL = 0;
int PATH = 1;
int AVAILABLE = 2;
int VISITED = 3;
int START = 4;
int END = 5;

color BLACK = color(0);
color WHITE = color(255);
color GREY = color(170);
color BLUE = color(100,100,255);
color RED = color(255,0,0);
color GREEN = color(0,255,0);

Block[][] blocks;
MOVELIST ML;

void setup() {
  size(600,600);
  background(0);
  frameRate(10);
  
  ReadMaze(file);
  ML = new MOVELIST(10);
  solve(startrow, startcol);
  DisplayMaze();
  idraw = 1;
}

void draw() {
  if (idraw < ML.filled) {
    Move A = ML.get(idraw);
    blocks[A.row][A.col].c = ML.get(idraw).c;
    ++idraw;
  } else {
    idraw = 1;
    ReadMaze(file);
  }
  DisplayMaze();
}

void ReadMaze(String filename) {
  String[] lines = loadStrings(filename);
  rows = lines.length;
  columns = lines[0].length();
  bwidth = width / float(columns);
  bheight = height / float(rows);
  
  blocks = new Block[rows][columns];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      int type = -1;
      color c = (-1);
      switch (lines[i].charAt(j)) {
        case '#':
          type = WALL;
          c = BLACK;
          break;
        case ' ':
          type = AVAILABLE;
          c = WHITE;
          break;
        case '$':
          type = END;
          c = RED;
          break;
        case '?':
          type = START;
          c = GREEN;
          startrow = i;
          startcol = j;
          break;
      }
      blocks[i][j] = new Block(bwidth * j, bheight * i, bwidth, bheight, type, c);
    }
  }
}

void DisplayMaze() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0 ; j < columns; j++) {
      blocks[i][j].display();
    }
  }
}

boolean solve(int row, int col) {
  if (blocks[row][col].type == END) {
    return true;
  }
  if (blocks[row][col].type == WALL || blocks[row][col].type == PATH || blocks[row][col].type == VISITED) {
    return false;
  }
  blocks[row][col].type = PATH;
  ML.append(row, col, BLUE);
  if (solve(row-1,col) == true) {
    return true;
  }
  if (solve(row,col+1) == true) {
    return true; 
  }
  if (solve(row+1,col) == true) {
    return true; 
  }
  if (solve(row,col-1) == true) {
    return true; 
  }
  blocks[row][col].type = VISITED;
  ML.append(row, col, GREY);
  return false;
}
