
// WallBounce with gravity

/** 95% of the time, in this code, we'll be working inside World Coordinates
For this problem, World Coordinates are a normal, mathematical world with
(-100 <= x <= 100) and (-100 <= y <= 100) and the origin at the 
center of the screen.  Most of the time, until the very end, we don't
care about the peculiarities of Processing's coordinates.

Then, at the end, we'll just use the map() function to convert from our
world coords to Processing coords to place and size our bouncing circle.
*/ 

float x, y; // center of circle
float radius;  // in world coords, etc.
float vel;  // how far the circle moves (initially) from frame to frame
float xvel, yvel;  // the x and y components of vel
float angle; // initial angle 
float g;  // gravity: how much to subtract from yvel every frame
float friction; // a number less than one (like 0.9) to diminish the
                // yvel after each  bounce on the floor: 
                // yvel = friction * yvel after a bounce
float px; // Proccessing's x coordinate after being mapped
float py; // Proccessing's y coordinate after being mapped

void setup() {
  // start near the left edge high up
  x = -80;
  y = 70;
  angle = random(PI/2);  // pointed up and to the right
  radius = 20;
  vel = 1.5;
  xvel = vel * cos(angle);
  yvel = vel * sin(angle);
  friction = 0.8;
  g = 0.2;
  size(400,400);
}

void draw() {
  background(200);
  
  x += xvel;  // move it
  y += yvel;
  px = map(x,-200,200,0,400);
  py = map(y,-200,200,400,0);
  
  // Now worry about walls, and gravity and floor bounces...
  if(px - radius < 0 || px + radius > width) {
    xvel = -xvel;
  }
  if(py - radius < 0 || py + radius > height) {
    y = -200 + radius; // if the ball is detected below the floor, bring it back up
    yvel = -yvel * friction; 
  }
  
  yvel -= g;
  
  circle(px,py,2*radius);
  println(py);
}
