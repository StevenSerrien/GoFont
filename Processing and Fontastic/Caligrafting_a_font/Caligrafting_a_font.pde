import geomerative.*;

PFont font;

RFont f;
RGroup grp;
RShape s;

float len;
float angle;
float pos;

//------------------------ Runtime properties ----------------------------------
// Save each frame
boolean SAVEVIDEO = false;
boolean SAVEFRAME = true;
boolean APPLICATION = false;

String DEFAULTAPPLETRENDERER = JAVA2D;
int DEFAULTAPPLETWIDTH =600;
int DEFAULTAPPLETHEIGHT =600;

String DEFAULTAPPLICRENDERER = OPENGL;
int DEFAULTAPPLICWIDTH = 600;
int DEFAULTAPPLICHEIGHT =600;
//------------------------------------------------------------------------------


// The error range for the tangent position and angle
float ANGLEERROR = 0.1;
float POINTERROR = 0;


// The length variation of the tangnet
//   -> 500: sketchy, blueprint
//   -> 150: light blueprint
//   -> 2000: mystic
float LENGTHTANGENT = 30;

// The initial text
String STRNG = "S";

String FONT = "Lato-Regular.ttf";

// The alpha value of the lines
int ALPHAVALUE = 2;

// The velocity of the calligraphy
int VELOCITY = 1;

int MARGIN = 1;

String newString = "";

void setup(){
  
  int w = DEFAULTAPPLICWIDTH, h = DEFAULTAPPLICHEIGHT;
  String r = DEFAULTAPPLICRENDERER;
  
  if(!APPLICATION){
    // Specify the widtha and height at runtime
    //w = int(param("width"));
    //h = int(param("height"));
    //r = (String)param("renderer");
  
 
    // (String) will return null if param("renderer") doesn't exist
    if (r != OPENGL && r != P3D && r != JAVA2D && r != P2D) {
      r = DEFAULTAPPLETRENDERER;
    }
    // int() will return 0 if param("width") doesn't exist
    if (w <= 0) {
      w = DEFAULTAPPLETWIDTH;
    }
    // int() will return 0 if param("height") doesn't exist
    if (h <= 0) {
      h = DEFAULTAPPLETHEIGHT;
    }
  }
  
  size(600,600,OPENGL);
  background(255);
  frameRate(25);
  
  LENGTHTANGENT = LENGTHTANGENT * width/800F;
  
  try{
    smooth();
  }catch(Exception e){}
  
  noFill();
  
 

    stroke(0, 0, 0,80);
   noFill();

  //f = new RFont(this, FONT, 372, RFont.CENTER);
    RG.init(this);
    f = new RFont(FONT, 372, RFont.CENTER);

  initialize();
}

void draw(){
  pushMatrix();
  translate(width/2,height/2);
  // Draw very low alpha and long tangents on random points of each letters
  for(int i=0;i<grp.countElements();i++){
    s = (RShape)(grp.elements[i]);

    for(int j=0;j<s.countChildren();j++){
      for(int k=0;k<VELOCITY;k++){
        pos = random(0, 1);

        RPoint tg = s.children[j].getTangent(pos);
        RPoint p = s.children[j].getPoint(pos);

        p.x = p.x + random(-POINTERROR,POINTERROR);
        p.y = p.y + random(-POINTERROR,POINTERROR);

       len = random(-LENGTHTANGENT, LENGTHTANGENT);
       angle = atan2(tg.y, tg.x) + random(-ANGLEERROR, ANGLEERROR);
        
        bezier(p.x,p.y,10,10,90,90,15,80);    
        
      }
    }
  }
  popMatrix();
}

void initialize(){
  grp = f.toGroup(STRNG);
  grp.centerIn(g,MARGIN,1,1);
  
  background(255);
}