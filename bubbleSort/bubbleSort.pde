PrintWriter output;
String text = "Elements: ";
int[] elements = new int[10];
boolean iterate = false;

void setup() {
  output = createWriter("sort.txt");
  
  for (int i = 0; i < elements.length; i++) {
    elements[i] = int(random(0,11));
    text += (str(elements[i]) + " ");
  }
  
  output.println(text);
  compare();
}

void draw() {
  for (;iterate;) {
    iterate = false;
    compare();
  }
  output.flush();
  output.close();
  exit();
}

void compare() {
  for (int i = 0; i < elements.length - 1; i++) {
    if (elements[i] > elements[i + 1]) {
      int s = elements[i + 1];
      elements[i] = elements[i + 1];
      elements[i + 1] = s;
      output.println("swap " + str(i) + " " + str(i + 1) + " " + "true");
      iterate = true;
    } else {
      output.println("swap " + str(i) + " " + str(i + 1) + " " + "false");
    }
  }
}
