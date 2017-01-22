# GoFont
Proof of Concept - Is it possible to generate a font via code

## Babysteps - How does one create a simple font?
###1. Learn about font fundamentals
![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/on-web-typography.jpg)
It's important to know how typography is structured before you can actually start making your own. Personally, I found that 'On Web Typography' - Written by Jason Santa Maria was a good starting point. It goes into detail, but it can definitely get you started.
However, I've written down the most important things you should know to start a font below.

* **Baseline:** Where all the letters sit. This is basicly the bottom of all the letters.
* **Overhang:** Letters like 'O' or 'B' can dip below the actual bottom of all other letters. (baseline)
* **X-height:** A line used to define the height of all lowercase letters.
* **Cap Height:** A line used to define the height of all uppercase letters.
* **Ascender height:** Letters like 'k' or 'h' have an ascender that ascends the normal x-height. The height of these ascenders are called 'ascender height'.
* **Descender height:** Letters like 'p' or 'q' have a descender that descends lower than baseline. The height of these descenders are called 'descender height'.

###2. Start by hand
Whenever designing a font, one should start by drawing/designing a few letters to get a feel of what the font should look like.
Often called 'control characters', you would start designing the latin characters:

'n' and 'o' - lowercase letters.
'H' and 'O' - uppercase letters.

Consequently, you would add more letters to those to form the word: _adhesion_. This word is often use to get a feel of how the typeface should be proportioned.

![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/handdrawings.jpg)

###3. Digitize your drawings
Outline your drawed letters and fill the insides with a black marker. Take a picture with your smartphone and upload it to your computer.

###4. Choose your software
Unfortunately, creating typefaces seems to be a Mac business. Most people recommend software like [Glyps](www.glyphsapp.com) or [RoboFont](http://doc.robofont.com/). I cannot use these apps, so I will need to find a Windows alternative. FontForge seems to be a common program to use, although be it with a learning curve.

###5. Use the software
There seems to be some documentation online. However, the program will require some training. Luckily for us, FontForge is an open-source project, wich means there are alot of people making sure people can use the software as efficient as possible.
I will be following this guide in order to make my first typeface - [GitHub FontForge guide](http://designwithfontforge.com/en-US/Configuring_FontForge.html)

Should you have chosen FontForge, I suggest you take a look at this [introductionary video](https://www.youtube.com/watch?v=_EhwHL1aloI)
This was made at the Crafting Type workshop in the Hyper Island college in Sweden. It goes over the basics of FontForge and tries to make you familiar with its tools.

###6. Start making your glyphs
So, with that in mind and a little more in-depth tutorial to [FontForge's tools](https://www.youtube.com/watch?v=_EhwHL1aloI) read and understood, we go to the following step. Making our glyphs. And as previously mentioned, we ofcourse start with the letter 'n' with our handdrawn letters as reference. Below you can see a screenshot of me designing my 'n'.

![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/creatin-n-in-fontforge.png)

Once we created the 'n' and 'o' we can already see how the font works together and start spacing it via the 'Metrics -> New Metrics Window' option.

![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/font-metrics-testing.png)

Now that we have a basic understanding of how creating letters work, you can actually create the rest of the typeface by having your 'o' and 'n' as base for your typeface. After that, you can simply save the typeface and install it like any other!

## What tools can we use to randomize a typeface?
### Processing + Fontastic (library)
Next up, I found a library that indeed does randomize typeface using the program. The description of Processing goes as followed on their website: "Processing is a flexible software sketchbook and a language for learning how to code within the context of the visual arts." Now, personally I have never used it and I doubt it could be used in an browser, but it was worth a shot.

To start, you should go ahead and download [Processing 3](https://processing.org/download/). After you've downloaded Processing, it's time to download the library we are using, called: 'Fontastic' wich can be downloaded [here](http://code.andreaskoller.com/libraries/fontastic/). You then just copy the folder 'Fontastic' to your Documents/Processing/Libraries, and you should be good to go.
Start up Processing 3 and import the 'Fontastic' library (Sketch -> Import Library)

#### First code using Processing + Fontastic
```java
import fontastic.*;

Fontastic f = new Fontastic(this, "ExampleFont");

f.setAuthor("Steven Serrien");
f.setAdvanceWidth(250);
PVector[] points = new PVector[4];
points[0] = new PVector(0, 0);
points[1] = new PVector(random(512), 0);
points[2] = new PVector(random(512), random(1024));
points[3] = new PVector(0, random(1024));

f.addGlyph('A'). addContour(points);
f.getGlyph('A').addContour(points);
f.buildFont();
f.cleanup();
```
Running this will create a webfont + a HTML preview file. Like this one below. As you can see, only the 'A'-glyph has been generated.
![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/fontastic-html-preview.png)

This is not exactly what we need. What we could use is a script that would distort an existing typeface we load. Currently, we got following code in Processing that distorts the typeface 'Lato-Regular' based upon the X-coordinate of your mouse inside the canvas.
```java
 /**
 * Fontastic
 * A font file writer for Processing.
 * http://code.andreaskoller.com/libraries/fontastic
 *
 * Example: DistortFont
 *
 * How to create character shapes based on another font.
 * - Press 's' to save ttf and woff files
 *   in the current state of distortion
 *
 * Based on the example P_3_2_1_01.pde by Generative Gestaltung
 * http://www.generative-gestaltung.de/P_3_2_1_01
 * 
 * @author      Andreas Koller http://andreaskoller.com
 */

import fontastic.*;
import geomerative.*;


Fontastic f;
RFont font;

PFont myFont;

int version = 0;

int charWidth = 512;

boolean fontBuilt = false;


void setup() {

  size(600, 400);
  fill(0);

  // always initialize the library in setup
  RG.init(this);
  
  // load the initial font
  font = new RFont("Lato-Regular.ttf",150);

  // get the points on the curve's shape
  // set style and segment resultion
  RCommand.setSegmentLength(200);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  initFont();

  updateFont();

}


void draw() {

  updateFont();

  background(255);

  strokeWeight(2);
  textSize(25);

  int numberOfLetters = 10;
  for (int i=0; i<numberOfLetters; i++) {
    pushMatrix();
    translate(width/2, height/3);
    scale(charWidth/1000f / 5f);
    translate(-(numberOfLetters -1)*charWidth / 2 + i*charWidth, 0);
    translate(-charWidth/2, charWidth/2);
    noStroke();
    fill(0,128,255);
    renderGlyphSolid(Fontastic.alphabet[i]);
    popMatrix();
  }

  if (fontBuilt) { // if the ttf has already been built, display it
    pushMatrix();
    textFont(myFont);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(charWidth / 5f);
    text(new String(subset(Fontastic.alphabet, 0, numberOfLetters)), width/2, height*0.6);
    popMatrix();
  }
 
}

void initFont() {

  f = new Fontastic(this, "Distort" + nf(version,4));

  for (char c : Fontastic.alphabet) {
    f.addGlyph(c);
  }

  for (char c : Fontastic.alphabetLc) {
    f.addGlyph(c);
  }

//  f.setFontFamilyName("Confetti");  // if font has same name, it won't be loaded by Processing in runtime
  f.setAuthor("Andreas Koller");
  f.setVersion("0.1");
  f.setAdvanceWidth(int(charWidth * 1.1));

}

void updateFont() {


  RCommand.setSegmentLength(mouseX / 2f);

  float maxOffset = 20; // seems to be the maximum value for setSegmentOffset with the font FreeSans
  float speed = 40;
  float timer = (millis()/speed) % maxOffset;
  float offset = (sin(timer / maxOffset * TWO_PI) + 1) * maxOffset / 2; // this is an sin oscillator between 0 and 100
  RCommand.setSegmentOffset(offset);
  
  for (char c : Fontastic.alphabet) {

    RShape shp = font.toShape(c);

    RPoint[] pnts = new RPoint[0];
    try {    
      pnts = shp.getPoints();
    }
    catch (NullPointerException e) {
      println("Problem with setSegmentOffset at Character "+c);
    }

    PVector[] points = new PVector[0];

    for (int i=0; i<pnts.length-1; i++) {
      RPoint p = pnts[i];
      points = (PVector[]) append(points, new PVector(p.x * 5, -p.y * 5));   
    }
    f.getGlyph(c).clearContours();
    f.getGlyph(c).addContour(points);
  }

}


void createFont() {

  f.buildFont(); // write ttf file
  f.cleanup();   // delete all glyph files that have been created while building the font
  
  fontBuilt = true;

  myFont = createFont(f.getTTFfilename(), 200); // set the font to be used for rendering

  version++;
  
  initFont();   // and make a new font right away

}

void renderGlyphSolid(char c) {
    
  FContour[] contours = f.getGlyph(c).getContoursArray();

  for (int j=0; j<contours.length; j++) {

    FPoint[] points = f.getGlyph(c).getContour(j).getPointsArray();

    if (points.length > 0) { //just to be sure    
      // Draw the solid shape in Processing
      beginShape();
      vertex(points[0].x, -points[0].y);
      for (int i=0; i<points.length; i++) {
        FPoint p1 = points[i];
        FPoint p2 = points[(i+1)%points.length];
        if (p1.hasControlPoint2() && p2.hasControlPoint1()) {
          bezierVertex(p1.controlPoint2.x, -p1.controlPoint2.y, p2.controlPoint1.x, -p2.controlPoint1.y, p2.x, -p2.y);
        }
        else {
          vertex(p1.x, -p1.y);
        }
      }
      endShape();
    }
  }

}

void keyPressed() {

  if (key == 's') {
    createFont();
  }
  
}
```
This code in Processing + Fontastic would give us following output in our view.
![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/distorted-font-generation.gif)

####Now, how do we transfer this logic to inside a browser, making the output of a typeface generated based on the user's input?
It turns out there is a port called 'Processing.js' wich ports all java-code you write inside a example.pde to javascript code so we can use it in a browser window using the HTML5 canvas. 

### Processing.js ( A javascript port for Processing )
The steps to setting up Processing.js can be found here [tutorial](http://processingjs.org/articles/p5QuickStart.html)
Following the steps, we can form following output inside a html file.

```html
<!DOCTYPE html>
<html>
<head>
<title>Hello Web - Processing.js Test</title>
<script src="processing.js"></script>
</head>
<body>
<h1>Processing.js Test</h1>
<p>This is my first Processing.js web-based sketch:</p>
<canvas data-processing-sources="hello-web.pde"></canvas>
</body>
</html>
```

In the .pde file you would then write whatever code you would in a normal Processing java file. __However__, we get an issue here since we are actually importing Fontastic as a java library. Turns out Processing.js does port our PDE file, but __does not__ port our libraries... This conclusion can be found [here](http://stackoverflow.com/questions/7681540/using-processing-libraries-in-processing-js) and [also here](http://stackoverflow.com/questions/7742617/what-is-it-that-stops-processings-libraries-from-being-used-to-processing-js)

Seems like we need to find a way around this, maybe try to achieve what we want without any libraries?

### Type + Code : Processing For Designers
![alt tag](https://github.com/StevenSerrien/GoFont/blob/master/images/type_code_book.jpg)

After some research, I stumbled upon a book called: "Type + Code: Processing for Designers" by Yeohyun Ahn and Viviana Cordova.
The whole e-book can be found here: [e-book-link](https://issuu.com/jpagecorrigan/docs/type-code_yeohyun-ahn).

The book displays some wonderful typography designs and even has a few pages with code included.
Unfortunately, when I tried to replicate the code that was stated in the book, it did nothing.
First of all, the book dates from 2009 wich means some syntax was deprecated and I had to figure what new syntax there was for that code within the examples. Secondly, when I DID replace all syntax, the code just brought up an empty canvas and did nothing.. Pity.
This was exactly what I was looking for, and combined with Fontastic I could generate a new type of font to then save.

Maybe I should try to go back to the Processing version of the book's published date?









