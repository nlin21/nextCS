/* ===================
  The goal of this lab is to write a steganography
  encoding/decoding program.
  This program should encode a scret message within the blue
  value of randomly selected pixels.
  Pixels that contain part of the message will have a red
  value of 255.
  Any pixels that naturally have a red value of 255 will
  change to have a red value of 254.
  To test your decoding function, secret.png has been
  provided. When successfully decoded, you should get
  "hi everybody!"
  Once you know decoding is working, then work on encode,
  and use decode to test your work, then modify the
  keyPressed method to load a normal image.
 =================== */
PImage art;

void setup() {
  size(256, 256);
  art = loadImage("secret.png");
  art.loadPixels();

  image(art, 0, 0);
}

void draw() {
  image(art, 0, 0);
}

void keyPressed() {
  if (key == 'r') {
    //orginal cat image, no secret message
    art = loadImage("cat.jpg");
  }
  if (key == 'e') {
    art = encode(art, "this is a secret message");
    image(art, 0, 0);
    saveFrame("data/secret1.png");
  }
  if (key == 'd') {
    println(decode(art));
  }
}//keyPressed
/* ===================
  This function will take an image with a secret message encoded
  via encode, and return the secret message as a String.
  You can concatenate chars with Strings by using +=
  on a String variable. (e.g. message+= 'a')
 =================== */
String decode(PImage img) {
  String message = "";
  for (int i = 0; i < img.pixels.length; i++) {
    if (red(img.pixels[i]) == 255) {
      message += char(int(blue(art.pixels[i])));
    }
  }
  return message;
}


/* ===================
  This function will return an array of randomly chosen integers used
  to help encode our secret message.
  The returned array should contain numSecret random values in the range
  [0, numPixels].
  The random values should be in strcictly increasing order.
 =================== */
int[] getSecretPixels(int numSecrets, int numPixels) {
  int[] secretPixels = new int[numSecrets];
  for (int i = 0; i < secretPixels.length; i++) {
    if (i == 0) {
      secretPixels[i] = int(random(0, (1.0/numSecrets) * numPixels));
    } else {
      secretPixels[i] = int(random(secretPixels[i-1], ((1.0+i)/numSecrets) * numPixels));
    }
  }
  // positions of encoded characters
  println(secretPixels);
  return secretPixels;
}


/* ===================
  This function will return a new PImage that encodes secret in the
  blue value of randomly chosen pixels.
  Pixels that contain encoded chars should have a red value of 255,
  a green value the same as the original image, and a blue value of
  the next charater in message.
  Any pixels in the original image with a red value of 255 should
  become pixels with the same green and blue values, and a red value
  of 254.
  The indices of the encoded pixels will be randomly generated
  by getSecretPixels
  secret.charAt(i) will return the character of secret at index i.
 =================== */
PImage encode(PImage img, String secret) {
  PImage tmp = new PImage(img.width, img.height);
  tmp.loadPixels();
  arrayCopy(img.pixels, tmp.pixels);
 
  int[] secretPixels = getSecretPixels(secret.length(), img.pixels.length);

  for (int i = 0; i < tmp.pixels.length; i++) {
    if (red(tmp.pixels[i]) == 255) {
      tmp.pixels[i] = color(254, green(tmp.pixels[i]), blue(tmp.pixels[i]));
    }
  }

  for (int i = 0; i < secretPixels.length; i++) {
    tmp.pixels[secretPixels[i]] = color(255, green(tmp.pixels[i]), int(secret.charAt(i)));
  }

  return tmp;
}//encode
