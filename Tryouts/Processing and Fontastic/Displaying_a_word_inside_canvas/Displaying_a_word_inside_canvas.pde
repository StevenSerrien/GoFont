import geomerative.*;

PFont myFont;
void setup() {
 size(200,200);
 background(255,255,255);
 myFont = createFont("Univers", 32);
 textFont(myFont);
 
 fill(0,0,0);
 translate(55,90);
 text("TYPE",0,0);
}