/*=====================
  This class does not need to be modified.

  It is the same OrbNode class we've been working on with
  2 important changes.

  0) There is now a concept of mass applied in run()
     Mass is determined as osize/PART_SIZE.
      When an OrbNode is made, it has a mass of 1.
    There is a method embiggen(f) which will add f
    to osize.
    You will use embiggen in the main drive file.

  1) There is a method contains(p) which takes a
     PVector and returns true if p is inside the
     OrbNode
  =====================*/
class OrbNode {

  static final float SPRING_LEN = 50;
  static final float SPRING_CONST = 0.005;
  static final float DAMPING = 0.995; //1 is no damping, lower numbers is more aggressive damping
  static final int PART_SIZE = 15;

  PVector position;
  PVector velocity;
  PVector acceleration;
  int osize;
  float mass;
  color c;

  OrbNode next;
  OrbNode previous;

  OrbNode(int x, int y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    osize = PART_SIZE;
    c = color(240, 140, 40);
  }//constructor

  boolean contains(PVector p) {
    float d = position.dist(p);
    return d <= osize;
  }//contains

  void embiggen(float factor) {
    osize+= factor;
  }//embiggen

  void run() {
    acceleration.mult(osize/PART_SIZE);
    velocity.add(acceleration);
    velocity.mult(DAMPING);
    position.add(velocity);
    acceleration.mult(0);
    if (checkYBounds()) {
      velocity.y*= -1;
      position.y+= velocity.y;
    }
    if (checkXBounds()) {
      velocity.x*= -1;
      position.x+= velocity.x;
    }
  }//run

  void applyForce(PVector f) {
    acceleration.add(f);
  }//applyForce

  boolean checkYBounds() {
    boolean check = position.y <= osize/2;
    check = check || position.y >= height - osize/2;
    return check;
  }//checkYBounds
  boolean checkXBounds() {
    boolean check = position.x <= osize/2;
    check = check || position.x >= width - osize/2;
    return check;
  }//checkXBounds

  void display() {
    if (next != null) {
      stroke(40, 200, 190);
      line(position.x+1, position.y+1, next.position.x+1, next.position.y+1);
    }
    if (previous != null) {
      stroke(210, 50, 150);
      line(position.x-1, position.y-1, previous.position.x-1, previous.position.y-1);
    }
    stroke(0);
    fill(c);
    circle(position.x, position.y, osize);
  }//display

  String toString() {
    return position.toString();
  }//toString

  void applySpringForce() {
    if (next != null) {
      velocity.add(calculateSpringForce(next));
    }
    if (previous != null) {
      velocity.add(calculateSpringForce(previous));
    }
  }//applySpringForce


  PVector calculateSpringForce(OrbNode other) {
    //float dist = position.dist(other.position);
    //float displacement = dist - SPRING_LEN;
    //float springForce = displacement * SPRING_CONST;

    //float xDiff = other.position.x - position.x;
    //float yDiff = other.position.y - position.y;
    //float xForce = springForce * xDiff/dist;
    //float yForce = springForce * yDiff/dist;

    //return new PVector(xForce, yForce);
    
    PVector vector = PVector.sub(position, other.position);
    float force = -1 * SPRING_CONST * (vector.mag() - SPRING_LEN);
    float angle = vector.heading();
    return new PVector(force * cos(angle), force * sin(angle));
  }//calculateSpringForce
}//OrbNode
