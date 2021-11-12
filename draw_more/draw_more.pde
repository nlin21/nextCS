String[] colorStrings = {"R", "G", "B", "RG", "Rg", "RB", "Rb", "rG", "GB", "Gb", "rB", "gB", " "};
Palette[] palettes = new Palette[colorStrings.length];

int RED = 0;
int GREEN = 0;
int BLUE = 0;
float paletteSize = 30;
float last_x;
float last_y;

void setup() {
  size(900, 900);
  background(0);
  stroke(255);
  strokeWeight(2);
  
  // setup and center color palettes
  for(int i = 0; i < colorStrings.length; i++) {
    palettes[i] = new Palette((0.5*(width/float(colorStrings.length)-paletteSize) + (width/float(colorStrings.length))*i), 30, paletteSize, colorConvert(colorStrings[i]));
  }
  // draw color palettes
  for(int i = 0; i < palettes.length; i++) {
    palettes[i].display();
  }
}

void draw() {
  for(int i = 0; i < palettes.length; i++) {
    if(mousePressed && palettes[i].detectMouse()) {
      stroke(palettes[i].c);
    }
  }
  
  // drawing function
  if(mousePressed) {
    line(last_x, last_y, mouseX, mouseY);
  }
  // erase function
  if(mousePressed && palettes[colorStrings.length - 1].detectMouse()) {
    setup();
  }
  
  last_x = mouseX;
  last_y = mouseY;
}

// translates colorStrings into actual colors
color colorConvert(String Color) {
    RED = 0; GREEN = 0; BLUE = 0;
    for(int i = 0; i < Color.length(); i++) {
      switch(Color.charAt(i)) {
        case 'R':
          RED = 255;
          break;
        case 'G':
          GREEN = 255;
          break;
        case 'B':
          BLUE = 255;
          break;
        case 'r':
          RED = 180;
          break;
        case 'g':
          GREEN = 180;
          break;
        case 'b':
          BLUE = 180;
          break;  
        case ' ':
          break;
      }  
    }
    return color(RED, GREEN, BLUE);
}



/* Palette Class */
               
class Palette {
  float x, y, size;
  color c;
  
  Palette(float x, float y, float size, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  void display() {
    fill(c);
    rect(x, y, size, size);
  }
  
  boolean detectMouse() {
    return (mouseX >= x && mouseX <= x + size) && (mouseY >= y && mouseY <= y + size); 
  }
}
