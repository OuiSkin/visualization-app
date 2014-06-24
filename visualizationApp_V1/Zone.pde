class Zone {

  // Declare variables
  float x;
  float y;
  int d;
  
  // Constructor to set initial values
  Zone(float xpos, float ypos) 
  {
    x = xpos;
    y = ypos;
    d = 50;
  }
  
//  // Update fields
//  void update() {
//    angleMid += speed;
//    angleMid = constrain(angleMid, 0, angleEnd);
//  }  
  
  // Draw the arc
  void display() 
  {
    ellipse(x, y, d, d);
    fill(0);
  }
}
