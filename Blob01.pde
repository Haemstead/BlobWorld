class Blob {
  
// The Blob is an organism of circular shape.
// Its body pulsations follow a sine wave.

// --- Data structures ---

// - Properties of the creature -
float minSize;                   // The size of the Blob when it has shrunk
float maxSize;                   // The size of the Blob when it has grown
float T;                         // The pulsation period of the Blob: how fast it pulsates
float phi;                       // The pfase shift

// - Variables describing its oscillation -

PVector location;                // The location of the Blob's centre on the screen
PVector direction;               // The orientation of the Blob
float averageSize;               // The size of the Blob halfway between maxSize and minSize
float maxAmp;                    // The maximum amplitudo of the pulsation
float currentSize;               // The current size of the Blob
float oldSize;

// --- Constructor ---

  Blob(float _min, float _max, float _T, float _phi, float _x, float _y) {
    
    // First, define the Blob's characteristic properties that describe its personality
    // The Blob pulsates in size between minSize and maxSize with period T.
    
    minSize = _min;     // Set the minimum size of the Blob
    maxSize = _max;     // Set the maximum size of the Blob
    T = _T;             // Set the period of pulsation
    phi = _phi;         // Set the phase shift

    // Then calculate other variables derived from the properties above
    averageSize = (minSize + maxSize)/2;
    maxAmp = (maxSize - minSize)/2;

    // Finally, set the Blob in the window and set its direction
    location = new PVector(_x, _y);
    direction = new PVector(1,0);
    currentSize = averageSize + maxAmp * sin(2*PI*(t/T)+phi);   
  }
  
// --- Methods ---

void update() {
  // Update calculates the current size of the Blob.
  oldSize = currentSize;
  currentSize = averageSize + maxAmp * sin(2*PI*(t/T)+phi);
}

void display() {
  fill(180,60);
  stroke(0);
  ellipse(location.x, location.y, currentSize, currentSize);
  fill(0);
  ellipse(location.x, location.y, 0.4*minSize, 0.4*minSize);
  stroke(255);
  line(location.x, location.y, location.x+0.2*minSize*direction.x, location.y+0.2*minSize*direction.y);
}

}
