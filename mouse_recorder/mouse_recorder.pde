int drawing_time = 2; // time in seconds for recording mouse movement 
  int frame_dt = 60 * drawing_time;
int radius_recording = 4;
int radius_displaying = 10;
int state = 0; // 0 = doing nothing yet, 1 = recording, 2 = displaying
boolean display_forward = false;

int[] xs = new int[frame_dt];
int[] ys = new int[frame_dt];

void setup() {
  size(600,400);
  background(200);
  frameRate(60);
}

void mousePressed() {
  if(state == 0) state = 1;
  frameCount = 0; // let frameCount be the array index
}

void draw() {
  // frameCount is now 1
  if(state == 0) return;
  if(state == 1) {
    if(frameCount - 1 < frame_dt) {
      xs[frameCount - 1] = mouseX;
      ys[frameCount - 1] = mouseY;
      circle(xs[frameCount - 1],ys[frameCount - 1],radius_recording);
    } else {
      state = 2;
      background(200);
      frameCount = 0;
    }
  }
  // frameCount is now 0
  if(state == 2 && !display_forward) {
    if(frameCount < frame_dt) {
      circle(xs[frame_dt - 1 - frameCount],ys[frame_dt - 1 - frameCount],radius_displaying);
    } else {
      switchDirections();
    }
  }
  if(state == 2 && display_forward) {
    if(frameCount < frame_dt) {
      circle(xs[frameCount],ys[frameCount],radius_displaying);
    } else {
      switchDirections();
    }
  }
}

void switchDirections() {
  background(200);
  fill(random(256),random(256),random(256));
  frameCount = 0;
  display_forward = !display_forward;
}
