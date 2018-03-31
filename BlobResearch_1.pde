// --------------------------------------------------------
//
// This program simulates a living Blob with an oscillating body
//
// (c) Hans Oosting
// 2018-03-30
// Based on Daniel Shiffman's book The Nature of Code
//
// --------------------------------------------------------

Blob myBlob;                      // Declare Blob object

PGraphics blobAnalysis;           // Declare image space for analysis of Blob data

float t, dt;                      // Time and timestep for the simulation
float min, max, T, phi, x0, y0;   // Blob parameters
String txt1, txt2, txt3, txt4;    // Strings for the analysis pane

void setup() {
  size(700,200);
  min = 90;
  max = 130;
  T = 200;
  phi = 0;
  x0 = 100;
  y0 = 100;
  myBlob = new Blob(min, max, T, phi, x0, y0);
  prepareAnalysis();
  t = 0;
  dt = 1;
}

void prepareAnalysis () {
  blobAnalysis = createGraphics(400,200);
  txt1 = "T = " + myBlob.T;
  txt2 = "minSize = " + myBlob.minSize;
  txt3 = "maxSize = " + myBlob.maxSize;
  txt4 = "phi = " + myBlob.phi;
  blobAnalysis.beginDraw();
    blobAnalysis.fill(0);
    blobAnalysis.text("Blobbus Circularis Haemsteadensis", 0,20);
    blobAnalysis.text(txt1, 0, 60);
    blobAnalysis.text(txt2, 0, 80);
    blobAnalysis.text(txt3, 0, 100);
    blobAnalysis.text(txt4, 0, 120);
    blobAnalysis.stroke(0);
    blobAnalysis.line(150, 100, 400, 100);
    blobAnalysis.line(150, 50, 150, 150);
    blobAnalysis.text("size",152,50);
  blobAnalysis.endDraw();
}

void updateAnalysis () {
  blobAnalysis.beginDraw();
    blobAnalysis.line(149+t, 150-100*(myBlob.oldSize-myBlob.minSize)/(myBlob.maxSize-myBlob.minSize), 150 + t, 150 - 100*(myBlob.currentSize - myBlob.minSize)/(myBlob.maxSize-myBlob.minSize));
  blobAnalysis.endDraw();
}


void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  myBlob.update();
  myBlob.display();
  updateAnalysis();
  image(blobAnalysis, 200,20);
  t = t + dt;
}
