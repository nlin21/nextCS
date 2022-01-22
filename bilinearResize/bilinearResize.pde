PImage flower;
color[][] original;
color[][] resized;

int originalX = 400;
int originalY = 600;
int resizedX = 0;
int resizedY = 600;

float x_ratio, y_ratio;

void setup() {
  frameRate(10);
  size(1200, 800);
  flower = loadImage("data/flower.jpeg");
  flower.loadPixels();
  loadPixels();
  
  original = new color[originalX][originalY];
  
  for (int i = 0; i < 400; i++) {
    for (int j = 0; j < 600; j++) {
      original[i][j] = flower.get(i, j);
    }
  }
}

void draw() {
  brc();
  
  for (int i = 0; i < width; i++) {
    for (int j = 0 ; j < height; j++) {
      pixels[j*width+i] = color(200);
    }
  }
  
  int resizedX = int(brcValue("resizedX"));
  int resizedY = int(brcValue("resizedY"));
 
  resized = new color[resizedX][resizedY];
  
  if (resizedX > 1) {
    x_ratio = float(originalX - 1) / (resizedX - 1);
  } else {
    x_ratio = 0;
  }
  if (resizedY > 1) {
    y_ratio = float(originalY - 1) / (resizedY - 1);
  } else {
    y_ratio = 0;
  }
  
  for (int i = 0; i < resizedX; i++) {
    for (int j = 0; j < resizedY; j++) {
      int x_1 = floor(x_ratio * i);
      int y_1 = floor(y_ratio * j);
      int x_2 = floor(x_ratio * i);
      int y_2 = floor(y_ratio * j);
      
      float x_weight = (x_ratio * i) - x_1;
      float y_weight = (y_ratio * j) - y_1;
      
      color p1 = original[x_1][y_1];
      color p2 = original[x_2][y_1];
      color p3 = original[x_1][y_2];
      color p4 = original[x_2][y_2];
      
      color pixel = color((red(p1)*(1 - x_weight)*(1-y_weight) + red(p2)*x_weight*(1-y_weight) + red(p3)*y_weight*(1-x_weight) + red(p4)*x_weight*y_weight), 
                          (green(p1)*(1 - x_weight)*(1-y_weight) + green(p2)*x_weight*(1-y_weight) + green(p3)*y_weight*(1-x_weight) + green(p4)*x_weight*y_weight),
                          (blue(p1)*(1 - x_weight)*(1-y_weight) + blue(p2)*x_weight*(1-y_weight) + blue(p3)*y_weight*(1-x_weight) + blue(p4)*x_weight*y_weight));
      
      resized[i][j] = pixel;
    }
  }
 
  for (int i = 0; i < resizedX; i++) {
    for (int j = 0; j < resizedY; j++) {
      pixels[j*width+i] = resized[i][j];
    }
  }
  
  updatePixels();
}
