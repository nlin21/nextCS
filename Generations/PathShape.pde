class PathShape {

  int MAX_RANDOM_POINTS = 10;
  //x, y point lists
  IntList xs;
  IntList ys;
  //bounding box for the shape
  int topY;
  int leftX;
  int shapeWidth;
  int shapeHeight;

  int centroid[];
  float area;
  float rotationSpeed;
  float displayAngle;

  color inside;
  color border;

  PathShape() {
    xs = new IntList();
    ys = new IntList();
    inside = color(int(random(256)), int(random(256)), int(random(256)));
    border = color(0);
    centroid = new int[2];
    area = 0;
    topY = 0;
    leftX = 0;
    shapeWidth = width;
    shapeHeight = height;
    rotationSpeed = 0;
    displayAngle = 0;
  }//constructor

  PathShape(int lx, int ty, int sw, int sh) {
    this();
    leftX = lx;
    topY = ty;
    shapeWidth = sw;
    shapeHeight = sh;
  }

  void randomize() {
    xs.clear();
    ys.clear();
    int right_x = leftX + shapeWidth;
    int bottom_y = topY + shapeHeight;
    int numPoints = int(random(3, MAX_RANDOM_POINTS+1));
    for (int s=0; s < numPoints; s++) {
      int x = int(random(leftX, right_x));
      int y = int(random(topY, bottom_y));
      addPoint(x, y);
    }
  }//random PathShape

  boolean isValid() {
    int right_x = leftX + shapeWidth;
    int bottom_y = topY + shapeHeight;
    boolean valid =  centroid[0] > leftX && centroid[0] < right_x;
    valid = valid && centroid[1] > topY && centroid[1] < bottom_y;
    return valid;
  }//isValid

  void display() {
    stroke(border);
    fill(inside);
    beginShape();
    for (int i = 0; i < xs.size(); i++) {
      vertex(xs.get(i), ys.get(i));
    }
    endShape(CLOSE);
    noStroke();
    fill(0, 0, 255);
    circle(centroid[0], centroid[1], 5);
  }//display

  void display(int x, int y) {

    stroke(border);
    fill(inside);

    pushMatrix();
    translate(x, y);
    displayAngle+= rotationSpeed;
    rotate(radians(displayAngle));

    beginShape();
    for ( int i = 0; i < xs.size(); i++ ) 
      vertex( xs.get(i), ys.get(i) );
    endShape(CLOSE);
    noStroke();
    fill(0, 0, 255);
    circle(centroid[0], centroid[1], 5);


    //smiley!
    fill(255);
    stroke(0);
    circle(-20, -20, 20);
    circle(20, -20, 20);
    fill(0);
    circle(-20, -20, 5);
    circle(20, -20, 5);

    noFill();
    strokeWeight(4);
    arc(0, 20, 80, 24, 0, PI);
    strokeWeight(1);


    popMatrix();
  }//display


  void setCentroid() {
    int sumX = 0;
    int sumY = 0;
    for (int i=0; i < xs.size(); i++ ) {
      int p0,p1;
      p0=i;
      if (i == xs.size()-1) {
        p1 = 0;
      }
      else {
        p1 = i+1;
      }
      sumX += (xs.get(p0) + xs.get(p1)) * ((xs.get(p0) * ys.get(p1)) - (xs.get(p1) * ys.get(p0)));
      sumY += (ys.get(p0) + ys.get(p1)) * ((xs.get(p0) * ys.get(p1)) - (xs.get(p1) * ys.get(p0)));
    }
    setArea();
    centroid[0] = int( (1 / (6 * area)) * sumX );
    centroid[1] = int( (1 / (6 * area)) * sumY );
  }//setCent

  void setArea() {
    area = 0;
    for ( int i=0; i < xs.size(); i++) {
      int p0, p1;
      p0 = i;
      if (i == xs.size()-1) {
        p1 = 0;
      }
      else {
        p1 = i+1;
      }
      area += (xs.get(p0) * ys.get(p1)) - (xs.get(p1) * ys.get(p0));
    }
    area = area * 0.5;
  }//setArea

  void addPoint(int x, int y) {
    xs.append(x);
    ys.append(y);

    setCentroid();
  }//addPoint


}//class PathShape
