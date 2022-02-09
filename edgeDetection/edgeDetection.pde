PImage fred;
int[] george; 
int threshold;
int state = 0;  // 0 = none
                // 1 = vertical detection
                // 2 = horizontal detection
                // 3 = omni-directional detection

void setup() {
  size(500,500);
}

void draw() {
  brc();
  
  String name = brcChanged();
  
  String path = brcValue("files");
  
  threshold = int(brcValue("threshold"));
  
  if (name.equals("Load")) {
    state = 0;
    if (path.equals("H")) {
      display("data/house2.jpeg");
    } else if (path.equals("C")) {
      display("data/car-square.jpeg");
    } else if (path.equals("B")) {
      display("data/butterfly-2-square.jpeg");
    }
    greyScale();
  }
  
  if (name.equals("Vertical edges")) {
    state = 1;
  }
  
  if (name.equals("Horizontal edges")) {
    state = 2;
  }
  
  if (name.equals("Omni-directional")) {
    state = 3;
  }
  
  if (state == 1) {
    vertical(threshold);
  } else if (state == 2) {
    horizontal(threshold);
  } else if (state == 3) {
    omni(threshold);
  } else {
    return;
  }
}

void display(String path) {
  fred = loadImage(path);
  fred.resize(width,height);
  fred.loadPixels();
  loadPixels();
  arrayCopy(fred.pixels, pixels);
  updatePixels();
}

void greyScale() {
  george = new int[width*height];
  for (int i = 0; i < george.length; i++) {
    george[i] = int(red(fred.pixels[i]) + blue(fred.pixels[i]) + green(fred.pixels[i]))/3;
    pixels[i] = color(george[i]);
  }
}

void vertical(int threshold) {
  for (int i = 0; i < width-1; i++) {
    for (int j = 0; j < height; j++) {
      if (abs(george[j*width+i] - george[j*width+(i+1)]) >= threshold) {
        pixels[j*width+i] = color(255);
      } else {
        pixels[j*width+i] = color(0);
      }
    }
  }
  updatePixels();
}

void horizontal(int threshold) {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height-1; j++) {
      if (abs(george[j*width+i] - george[(j+1)*width+i]) >= threshold) {
        pixels[j*width+i] = color(255);
      } else {
        pixels[j*width+i] = color(0);
      }
    }
  }
  updatePixels();
}

void omni(int threshold) {
  for (int i = 0; i < width-1; i++) {
    for (int j = 0; j < height-1; j++) {
      if (abs(george[j*width+1] - int((george[j*width+i] + george[(j+1)*width+i] + george[j*width+(i+1)])/3)) >= threshold) {
        pixels[j*width+i] = color(255);
      } else {
        pixels[j*width+i] = color(0);
      }
    }
  }
  updatePixels();
}
