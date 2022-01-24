int frameRate = 60;
float fadeOutTime = 2.0;
float fadeOutRate = 1/(frameRate*fadeOutTime);
float r = 200.0;
float g = 150.0;
float b = 100.0;

void setup() {
  size(300,300);
  frameRate(frameRate);
  background(r,g,b);
  loadPixels();
}

void draw() {
  color c = color(r-r*frameCount*fadeOutRate, g-g*frameCount*fadeOutRate, b-b*frameCount*fadeOutRate);
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = c;
  }
  updatePixels();
  
}
