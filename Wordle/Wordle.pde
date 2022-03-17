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
ArrayList greys = new ArrayList(0);

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
    return;
  }
  
  if (position == 5) {
  } else if (held != true && int(key) >= 97 && int(key) <= 122) {
    held = true;
    spaces[position][guess].enter(str(key));
  }

  if (position == 0) {
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
    for (int i = 0; i < 5; i++) {
      word += spaces[i][guess].s;
    }
    
    for (int i = 0; i < wordbank.length; i++) {
      if (word.equals(wordbank[i])) {
        accepted = true;
      }
    }

    if (accepted) {
      guess();
      position = 0;
    } else if (!accepted) {
      println("Not in word list");
    }

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
      greens.add(spaces[i][guess].s.toUpperCase());
    }
    won = true;
    println("You win!");
  } else {
    for (int i = 0; i < 5; i++) {
      spaces[i][guess].recolor(GREY);
      greys.add(spaces[i][guess].s.toUpperCase());
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
  
  for (int i = 0; i < greys.size(); i++) {
    for (int j = 0; j < letters1.length; j++) {
      if (greys.get(i).equals(str(letters1[j]))) {
        keyboard.row1[j].recolor(GREY);
      }
    }
    for (int j = 0; j < letters2.length; j++) {
      if (greys.get(i).equals(str(letters2[j]))) {
        keyboard.row2[j].recolor(GREY);
      }
    }
    for (int j = 0; j < letters3.length; j++) {
      if (greys.get(i).equals(str(letters3[j]))) {
        keyboard.row3[j].recolor(GREY);
      }
    }
  }
  
  for (int i = 0; i < yellows.size(); i++) {
    for (int j = 0; j < letters1.length; j++) {
      if (yellows.get(i).equals(str(letters1[j]))) {
        keyboard.row1[j].recolor(YELLOW);
      }
    }
    for (int j = 0; j < letters2.length; j++) {
      if (yellows.get(i).equals(str(letters2[j]))) {
        keyboard.row2[j].recolor(YELLOW);
      }
    }
    for (int j = 0; j < letters3.length; j++) {
      if (yellows.get(i).equals(str(letters3[j]))) {
        keyboard.row3[j].recolor(YELLOW);
      }
    }
  }
  
  for (int i = 0; i < greens.size(); i++) {
    for (int j = 0; j < letters1.length; j++) {
      if (greens.get(i).equals(str(letters1[j]))) {
        keyboard.row1[j].recolor(GREEN);
      }
    }
    for (int j = 0; j < letters2.length; j++) {
      if (greens.get(i).equals(str(letters2[j]))) {
        keyboard.row2[j].recolor(GREEN);
      }
    }
    for (int j = 0; j < letters3.length; j++) {
      if (greens.get(i).equals(str(letters3[j]))) {
        keyboard.row3[j].recolor(GREEN);
      }
    }
  }
  
  greys.clear();
  yellows.clear();
  greens.clear();
  guess++;
}

void mousePressed() {
  if (position == 5) {
  } else {
    if (mouseY >= 450 && mouseY <= 510) {
      if (mouseX > 25 && mouseX < 75) {
        spaces[position][guess].enter("Q");
      }
      if (mouseX > 80 && mouseX < 130) {
        spaces[position][guess].enter("W");
      }
      if (mouseX > 135 && mouseX < 185) {
        spaces[position][guess].enter("E");
      }
      if (mouseX > 190 && mouseX < 240) {
        spaces[position][guess].enter("R");
      }
      if (mouseX > 245 && mouseX < 295) {
        spaces[position][guess].enter("T");
      }
      if (mouseX > 300 && mouseX < 350) {
        spaces[position][guess].enter("Y");
      }
      if (mouseX > 355 && mouseX < 405) {
        spaces[position][guess].enter("U");
      }
      if (mouseX > 410 && mouseX < 460) {
        spaces[position][guess].enter("I");
      }
      if (mouseX > 465 && mouseX < 515) {
        spaces[position][guess].enter("O");
      }
      if (mouseX > 520 && mouseX < 570) {
        spaces[position][guess].enter("P");
      }
    }
    if (mouseY > 515 && mouseY < 575) {
      if (mouseX > 52 && mouseX < 102) {
        spaces[position][guess].enter("A");
      }
      if (mouseX > 107 && mouseX < 157) {
        spaces[position][guess].enter("S");
      }
      if (mouseX > 162 && mouseX < 212) {
        spaces[position][guess].enter("D");
      }
      if (mouseX > 217 && mouseX < 267) {
        spaces[position][guess].enter("F");
      }
      if (mouseX > 272 && mouseX < 322) {
        spaces[position][guess].enter("G");
      }
      if (mouseX > 327 && mouseX < 377) {
        spaces[position][guess].enter("H");
      }
      if (mouseX > 382 && mouseX < 432) {
        spaces[position][guess].enter("J");
      }
      if (mouseX > 437 && mouseX < 487) {
        spaces[position][guess].enter("K");
      }
      if (mouseX > 492 && mouseX < 542) {
        spaces[position][guess].enter("L");
      }
    }
    if (mouseY > 580 && mouseY < 630) {
      if (mouseX > 107 && mouseX < 157) {
        spaces[position][guess].enter("Z");
      }
      if (mouseX > 162 && mouseX < 212) {
        spaces[position][guess].enter("X");
      }
      if (mouseX > 217 && mouseX < 267) {
        spaces[position][guess].enter("C");
      }
      if (mouseX > 272 && mouseX < 322) {
        spaces[position][guess].enter("V");
      }
      if (mouseX > 327 && mouseX < 377) {
        spaces[position][guess].enter("B");
      }
      if (mouseX > 382 && mouseX < 432) {
        spaces[position][guess].enter("N");
      }
      if (mouseX > 437 && mouseX < 487) {
        spaces[position][guess].enter("M");
      }
    }
  }
  
  if (mouseY > 580 && mouseY < 630) {
    if (mouseX > 492 && mouseX < 562) {
      if (position == 0) {
      } else if (position == 5) {
        spaces[4][guess].delete();
      } else {
        spaces[position][guess].delete();
      }
    }
  }
  
  if (mouseY > 580 && mouseY < 630) {
    if (mouseX > 32 && mouseX < 102) {
      if (position < 5) {
        println("Not enough letters");
      }
      
      if (position == 5) {
        for (int i = 0; i < 5; i++) {
          word += spaces[i][guess].s.toLowerCase();
        }
        
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
      }
    }
  }
}
