class Blob {
  
// The Blob is an organism if circular shape, that moves through fluid by inhaling and exhaling it.
// Its body pulsations follow a sine wave, and it accelerates as it shrinks, and decelerates as it grows.
// Its movements in the world are calculated by means of its acceleration.


// --- Data structures ---

// - Properties of the creature -
float minSize;                   // The size of the Blob when it has shrunk
float maxSize;                   // The size of the Blob when it has grown
float T;                         // The pulsation period of the Blob: how fast it pulsates
float rho;                       // The Blob's average density
float Mass;                      // The Blob's mass
float maxVelocity;               // The maximum velocity of the Blob

// - Variables describing its motion -

PVector location;                // The location of the Blob's centre on the screen
PVector velocity;                // The Blob's velocity
PVector acceleration;            // The Blob's acceleration towards the mouse
PVector direction;               // The Blob's current direction of movement
PVector mouseLoc;                // Location of the mouse
float averageSize;               // The size of the Blob halfway between maxSize and minSize
float maxAmp;                    // The maximum amplitudo of the pulsation
float currentSize;               // The current size of the Blob
float F;                         // The force it generates when contracting its body
float t;                         // The Blob's current position in the pulsation loop

// --- Constructor ---

  Blob() {
    
    // First, define the Blob's characteristic properties that describe its personality
    // The Blob pulsates in size between minSize and maxSize with period T.
    
    minSize = random(40,100);                          // Randomize the minimum size of the Blob
    maxSize = random(minSize + 10, minSize+ 100);      // Randomize the maximum size of the Blob
    T = random(20,200);                                // Randomize the period of pulsation
    rho = 0.1;
    maxVelocity = 2;

    // Then calculate other variables derived from the properties above
    averageSize = (minSize + maxSize)/2;
    maxAmp = (maxSize - minSize)/2;
    F = maxAmp/averageSize;
    Mass = averageSize * rho;

    // Finally, set the Blob somewhere in the window, with zero velocity in a certain phase of its pulsation cycle
    location = new PVector(random(0,width), random(0,height));  // The Blob starts in a random position.
    velocity = new PVector(0,0);                                // Initial velocity is zero.
    t = random(1)*T;                                            // Start at a random phase of its cycle
  }
  
// --- Methods ---

void update() {
  // Update calculates the current size of the Blob.
  // Then it calculates the acceleration and the direction of the mouse.
  // From the acceleration it derives the speed and location og the Blob.
  // Velocity is limited to a maximum velocity.
  // Finally, the timestep is increased.
  
  currentSize = averageSize + maxAmp * sin(2*PI*(t/T));
  float A = -F*cos(2*PI*(t/T))/Mass;
  if (A < 0) {
    A = 0;
  }
  mouseLoc = new PVector(mouseX, mouseY);
  direction = PVector.sub(mouseLoc, location);
  direction.normalize();
  acceleration = PVector.mult(direction,A);
  velocity.add(acceleration);
  velocity.limit(maxVelocity);
  location.add(velocity);
  t = t + dt;
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
