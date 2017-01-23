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