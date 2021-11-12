void setup() {
  size(400,400);
}

void draw() {
  // processing clock value = actual clock value - PI/2; -90 to 270 degrees
  float s = map(second(),0,60,-90,270);
  float m = map(minute(),0,60,-90,270);
  float h = map(hour(),0,12,-90,270);

  /* make the positions of the minute and hour hands proportional to the time passed
  ex: at 4:40 the hour hand will be closer to the 5 mark than the hour hand at 4:30
  let am = adjusted minute and ah = adjusted hour, both in degrees */
  float am = (second()/60.0)*6;
  float ah = (minute()/60.0)*30;
  
  // draw barebones clock
  background(0,150,200);
  stroke(0);
  strokeWeight(1);
  circle(200,200,300);
  
  // draw hour marks around the clock
  for(int i = -90; i <= 270; i += 30) {
    line(200+120*cos(radians(i)),200+120*sin(radians(i)),200+145*cos(radians(i)),200+145*sin(radians(i)));
  }  
  // draw minute marks around the clock
  for(int i = -90; i <= 270; i += 6) {
    // skip the hour marks
    if(i % 30 == 0) {continue;}
    line(200+130*cos(radians(i)),200+130*sin(radians(i)),200+140*cos(radians(i)),200+140*sin(radians(i)));
  }
  
  // draw numbers around the clock
  textSize(15);
  textAlign(CENTER);
  for(int i = -90, n = 0; i <= 270; i += 30, n++) {
    fill(0);
    if(n == 0) {continue;}
    text(str(n),201+110*cos(radians(i)),205+110*sin(radians(i)));
  }
  
  // write time on clock with blinks
  textSize(12);
  noFill();
  stroke(0,0,0,100);
  rect(174,255,50,20);
    // account for minute value less than 10
  String rm;
  if(minute() < 10) {
    rm = "0"+minute();
  } else {
    rm = str(minute());
  }
  if(second() % 2 == 0) {
    if(hour() == 0) {
      text("12:"+rm+" AM",200,270);
    } else if(hour() == 12) {
        text("12:"+rm+" PM",200,270);
    } else if(hour() >= 13) {
        text(str(hour()-12)+":"+rm+" PM",200,270);
    } else {
        text(str(hour())+":"+rm+" AM",200,270);
    }
  } else {
    if(hour() == 0) {
      text("12"+" "+rm+" AM",200,270);
    } else if(hour() == 12) {
        text("12"+" "+rm+" PM",200,270);
    } else if(hour() >= 13) {
        text(str(hour()-12)+" "+rm+" PM",200,270);
    } else {
        text(str(hour())+" "+rm+" AM",200,270);
    }
  }

  // draw second, minute, and hour hands
  stroke(255,0,0);
  line(200,200,200+100*cos(radians(s)),200+100*sin(radians(s)));
  stroke(0);
  line(200,200,200+75*cos(radians(m+am)),200+75*sin(radians(m+am)));
  strokeWeight(2);
  line(200,200,200+50*cos(radians(h+ah)),200+50*sin(radians(h+ah)));
  
  // draw center dot
  fill(0);
  circle(200,200,6);
  fill(255);
}
