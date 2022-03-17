Space[][] spaces = new Space[5][6];
Keyboard keyboard;

PFont f;

int position = 0;
int guess = 0;
boolean held = false;
boolean accepted = false;
boolean won = false;

String[] wordbank;
String[] targets;
String word = "";
String target = "";

color GREEN = color(125, 183, 0);
color YELLOW = color(238, 210, 2);
color GREY = color(50);

ArrayList greens = new ArrayList(0);
ArrayList yellows = new ArrayList(0);

void setup() {
  size(600, 700);
  background(0);
  noFill();
  stroke(75);
 
  f = createFont("ClearSans-Regular.ttf", 24);
  textFont(f);
  textAlign(CENTER);
  textSize(30);
  
  keyboard = new Keyboard();
  
  wordbank = loadStrings("wordbank.txt");
  targets = loadStrings("targets.txt");
  target = targets[int(random(0, targets.length))];

  fill(0);
  // draw 5x6 grid of black squares
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 6; j++) {
      spaces[i][j] = new Space(130 + 70*i, 10 + 70*j);
      spaces[i][j].display();
    }
  }  
}

void draw() {}

void keyPressed() {
  if (won) {
    // restrict keyboard input if the game is won or too many guesses
    return;
  }
  
  if (position == 5) {
    // if on the 5th letter, bypass the enter() function
  } else if (held != true && int(key) >= 97 && int(key) <= 122) {
    held = true;
    spaces[position][guess].enter(str(key));
  }

  if (position == 0) {
    // if on the 0th letter, bypass the delete() function
  } else if (held != true && int(key) == 8) {
    held = true;
    if (position == 5) {
      spaces[4][guess].delete();
    } else {
      spaces[position][guess].delete();
    }
  }

  if (int(key) == 10 && position < 5) {
    println("Not enough letters");
  }

  if (int(key) == 10 && position == 5) {
    // get the guess
    for (int i = 0; i < 5; i++) {
      word += spaces[i][guess].s;
    }

    // compare the guess with word bank/word of the day
    for (int i = 0; i < wordbank.length; i++) {
      if (word.equals(wordbank[i])) {
        accepted = true;
      }
    }

    if (accepted) {
      guess();
      position = 0;
    } else if (!accepted) {
      println("Invalid guess");
    }

    // reset for the next guess
    word = "";
    accepted = false;
  }
}

void keyReleased() {
  held = false;
}

void guess() {
  if (word.equals(target)) {
    for (int i = 0; i < 5; i++) {
      spaces[i][guess].recolor(GREEN);
    }
    won = true;
    println("You win!");
  } else {
    for (int i = 0; i < 5; i++) {
      spaces[i][guess].recolor(GREY);
      for (int j = 0; j < 5; j++) {
        if (word.charAt(i) == target.charAt(j)) {
          spaces[i][guess].recolor(YELLOW);
          yellows.add(spaces[i][guess].s.toUpperCase());
        }
        if (word.charAt(i) == target.charAt(i)) {
          spaces[i][guess].recolor(GREEN);
          greens.add(spaces[i][guess].s.toUpperCase());
        }
      }
    }
  }
  
  for (int i = 0; i < yellows.size(); i++) {
    for (int j = 0; j < letters1.length; j++) {
      if (yellows.get(i).equals(str(letters1[j]))) {
        row1[j].recolor(YELLOW);
      }
    }
    for (int j = 0; j < letters2.length; j++) {
      if (yellows.get(i).equals(str(letters2[j]))) {
        row2[j].recolor(YELLOW);
      }
    }
    for (int j = 0; j < letters3.length; j++) {
      if (yellows.get(i).equals(str(letters3[j]))) {
        row3[j].recolor(YELLOW);
      }
    }
  }
  
  guess++;
}
