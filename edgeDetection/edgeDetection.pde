PImage fred;
int[] george;  
int state;  // 0 = none
            // 1 = vertical detection
            // 2 = horizontal detection
            // 3 = omni-directional detection

void setup() {
  size(500,500);
  state = 0;
}

void draw() {
  brc();
  
  String name = brcChanged();
  
  String path = brcValue("files");
  
  if (path.equals("H")) {
    display("data/house2.jpeg");
  } else if (path.equals("C")) {
    display("data/car-square.jpeg");
  } else if (path.equals("B")) {
    display("data/butterfly-2-square.jpeg");
  }
  
  if (name.equals("Load")) {
    background(200);
    updatePixels();
  }
}

void display(String path) {
  fred = loadImage(path);
  fred.resize(width,height);
  fred.loadPixels();
  loadPixels();
  george = new int[width*height];
  greyScale();
}

void greyScale() {
  fred.loadPixels();
  for (int i = 0; i < george.length; i++) {
    george[i] = int(red(fred.pixels[i]) + blue(fred.pixels[i]) + green(fred.pixels[i]))/3;
    pixels[i] = color(george[i]);
  }
}

void vertical() {
  
}
