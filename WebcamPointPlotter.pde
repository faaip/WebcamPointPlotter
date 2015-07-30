import processing.video.*; 
Capture video;

int w=640/2, h=480/2;

void setup() {
  size(800, 600, P3D);
  background(255);
  video = new Capture(this, w, h); 
  video.start();
}

void draw() {
  background(255);

  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  translate(width/2-w/2, height/2-h/2, 100);

  video.loadPixels();

  for (int y = 0; y< h; y++)
  {
    for (int x = 0; x< w; x++)
    {
      color c= video.pixels[y*video.width+x]; 
      int r = c >> 16 & 0xFF; // Red
      int g = c >> 8 & 0xFF; // Green
      int b = c & 0xFF; // Blue

      stroke(r, g, b);
      point(30+x, y+30, -(int)(r+g+b)/3);
    }
  }


  // stroke(c);
  // point(x,y,brightness);
}

void captureEvent(Capture c) { 
  c.read();
}

