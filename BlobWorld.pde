// --------------------------------------------------------
//
// This program simulates a living Blob that swims around the screen in the direction of the mouse.
//
// The Blob has a pulsating body, as if it is inhaling and exhaling fluid.
// As it exhales, its body shrinks and it accelerates towards the mouse.
// As it inhales, the body swells and it decelerates.
//
// (c) Hans Oosting
// 2018-03-30
// Based on Daniel Shiffman's book The Nature of Code
//
// --------------------------------------------------------


Blob[] myBlobs = new Blob[10];  // Set up array containing 10 Blob creatures

float dt;                 // Timestep for the simulation

void setup() {
  size(800,600);
  for (int i = 0; i < myBlobs.length; i++) {
    myBlobs[i] = new Blob();
  }
  dt = 1;
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  fill(180);
  for (int i = 0; i < myBlobs.length; i++) {
   myBlobs[i].update();
   myBlobs[i].display();
  }
  
}
