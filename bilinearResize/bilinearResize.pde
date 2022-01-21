PImage flower;
color[][] original;
color[][] resized;

int originalX = 400;
int originalY = 600;
int resizedX = 500;
int resizedY = 700;

void setup() {
  size(1200, 800);
  flower = loadImage("data/flower.jpeg");
  flower.loadPixels();
  loadPixels();
 
  original = new color[originalX][originalY];
  resized = new color[resizedX][resizedY];
 
  // 2-D array for the default image
  for (int i = 0; i < 400; i++) {
    for (int j = 0; j < 600; j++) {
      original[i][j] = flower.get(i, j);
    }
  }
}

void draw() {
  background(200);
  
  float x_ratio = float((originalX - 1))/(resizedX - 1);
  float y_ratio = float((originalY - 1))/(resizedY - 1);
  
   for (int i = 0; i < resizedX; i++) {
     for (int j = 0; j < resizedY; j++) {
       int x_1 = floor(x_ratio * i);
       int y_1 = floor(y_ratio * j);
       int x_2 = ceil(x_ratio * i);
       int y_2 = ceil(y_ratio * j);
     
       float x_weight = (x_ratio * i) - x_1;
       float y_weight = (y_ratio * j) - y_1;
     
       color p1 = flower.pixels[y_1 * originalX + x_1];
       color p2 = flower.pixels[y_1 * originalX + x_2];
       color p3 = flower.pixels[y_2 * originalX + x_1];
       color p4 = flower.pixels[y_2 * originalX + x_2];
     
       color pixel = color((red(p1) * (1 - x_weight) * (1 - y_weight) + red(p2) * x_weight * (1 - y_weight) + red(p3) * y_weight * (1 - x_weight) + red(p4) * x_weight * y_weight),
                          (green(p1) * (1 - x_weight) * (1 - y_weight) + green(p2) * x_weight * (1 - y_weight) + green(p3) * y_weight * (1 - x_weight) + green(p4) * x_weight * y_weight),
                          (blue(p1) * (1 - x_weight) * (1 - y_weight) + blue(p2) * x_weight * (1 - y_weight) + blue(p3) * y_weight * (1 - x_weight) + blue(p4) * x_weight * y_weight));
     
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
