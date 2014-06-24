class Zone {

  // Declare variables
  float x;
  float y;
  float d;
  float angleStart;
  float angleMid;
  float angleEnd;
  float speed;
  float r;
  float g;
  float b;
  String title;
  
  // Constructor to set initial values
  Zone(String titleTemp, float angleEndTemp) {
     d = 100;
     x = width/2;
     y = height/2;
     angleStart = 0;
     angleMid = 0;
     angleEnd = angleEndTemp * PI;
     speed = .025;
     r = 255;
     g = 255;
     b = 255;
     title = titleTemp;
     
  }
  
  // Update fields
  void update() {
    angleMid += speed;
    angleMid = constrain(angleMid, 0, angleEnd);
  }  
  
  // Draw the arc
  void display() {
    noStroke();
    fill(r, g, b);
    arc(x, y, d, d, 0, angleMid);
    fill(0);
    text(title, x+5, y+15);
  }
}
