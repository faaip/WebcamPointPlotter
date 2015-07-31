import processing.video.*; 
Capture video;

int w=640/2, h=480/2;

void setup() {
  size(800, 600, OPENGL);
  background(255);
  video = new Capture(this, w, h); 
  video.start();
  camera(100, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 1); // Adjust camera
}

void draw() {
  noCursor();  
  background(255);
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 1); // Adjust camera
  translate(width/2-w/2, height/2-h/2, 100); 
  video.loadPixels(); // Load webcam feed to pixel array

  for (int y = 0; y< h; y++)
  {
    for (int x = 0; x< w; x++)
    {
      // Color extraction using bit-shifting
      color c= video.pixels[y*video.width+x];
      int r = c >> 16 & 0xFF; // Red
      int g = c >> 8 & 0xFF; // Green
      int b = c & 0xFF; // Blue
      stroke(c);
      point(30+x, y+30, ((int)(r+g+b)/3)+mouseY);
    }
  }
}

void captureEvent(Capture c) { 
  c.read();
}

