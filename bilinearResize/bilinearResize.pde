PImage flower;
color[][] original;
color[][] resized;

int originalX = 400;
int originalY = 600;
int resizedX, resizedY;

float x_ratio, y_ratio;

void setup() {
  frameRate(10);
  size(1200, 800);
  flower = loadImage("data/flower.jpeg");
  flower.loadPixels();
  loadPixels();
  
  // 2-D array for the pixels of the original image
  original = new color[originalX][originalY];
  
  // Assigns each pixel of the flower to its respective position in the 2-D array
  for (int i = 0; i < 400; i++) {
    for (int j = 0; j < 600; j++) {
      original[i][j] = flower.get(i, j);
    }
  }
}

void draw() {
  brc();
  
  // Resets the canvas for a new resized image to be displayed
  for (int i = 0; i < width; i++) {
    for (int j = 0 ; j < height; j++) {
      pixels[j*width+i] = color(200);
    }
  }
  
  // Takes the input from the "New Width" and "New Height" sliders
  int resizedX = int(brcValue("resizedX"));
  int resizedY = int(brcValue("resizedY"));
  
  // 2-D array for the pixels of the resized image
  resized = new color[resizedX][resizedY];
  
  // Calculates the ratio of the x position in the resized image to its interpolated x position in the original image
  if (resizedX > 1) {
    x_ratio = float(originalX - 1) / (resizedX - 1);
  } else {
    x_ratio = 0;
  }
  
  // Calculates the ratio of the y position in the resized image to its interpolated y position in the original image
  if (resizedY > 1) {
    y_ratio = float(originalY - 1) / (resizedY - 1);
  } else {
    y_ratio = 0;
  }
  
  for (int i = 0; i < resizedX; i++) {
    for (int j = 0; j < resizedY; j++) {
      
      // Calculates the coordinates of the four closest points in the original image to (i,j), 
      // where (i,j) is the coordinate of the point in the resized image to be interpolated
      int x_1 = floor(x_ratio * i);
      int y_1 = floor(y_ratio * j);
      int x_2 = floor(x_ratio * i);
      int y_2 = floor(y_ratio * j);
      
      // Calculates the weight (color) of the interpolated values
      float x_weight = (x_ratio * i) - x_1;
      float y_weight = (y_ratio * j) - y_1;
      
      // Take the colors of each of the four closest points
      color p1 = original[x_1][y_1];
      color p2 = original[x_2][y_1];
      color p3 = original[x_1][y_2];
      color p4 = original[x_2][y_2];
      
      // Finds the interpolated color value using a weighted average
      color pixel = color((red(p1) * (1 - x_weight) * (1 - y_weight) + red(p2) * x_weight * (1 - y_weight) + red(p3) * y_weight * (1 - x_weight) + red(p4) * x_weight * y_weight), 
                          (green(p1) * (1 - x_weight) * (1 - y_weight) + green(p2) * x_weight * (1 - y_weight) + green(p3) * y_weight * (1 - x_weight) + green(p4) * x_weight * y_weight),
                          (blue(p1) * (1 - x_weight) * (1 - y_weight) + blue(p2) * x_weight * (1 - y_weight) + blue(p3) * y_weight * (1 - x_weight) + blue(p4) * x_weight * y_weight));
      
      // Puts the newly interpolated color value into its respective position in the resized image array;
      resized[i][j] = pixel;
    }
  }
  
  // Maps the pixels of the resized image to the canvas for display
  for (int i = 0; i < resizedX; i++) {
    for (int j = 0; j < resizedY; j++) {
      pixels[j*width+i] = resized[i][j];
    }
  }
  
  updatePixels();
}
