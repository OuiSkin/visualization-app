class Zone 
{

  // Declare variables
  float xpos;
  float ypos;
  int dExtern;
  int dIntern;
  int rgb;
  
  // Constructor to set initial values
  Zone(float x, float y) 
  {
    xpos = x;
    ypos = y;
    dExtern = width/10;
    dIntern = 3*dExtern/4;
    rgb = 122;
  }
  
//  // Update fields
//  void update() {
//    angleMid += speed;
//    angleMid = constrain(angleMid, 0, angleEnd);
//  }  
  
  // Draw the zone
  void display() 
  { 
    fill(255);
    strokeWeight(1);    
    stroke(rgb);

    
    ellipse(xpos, ypos, dExtern, dExtern);
    ellipse(xpos, ypos, dIntern, dIntern);
  }
  
  // Make the zone green
  void select()
  {
    fill(255);
    strokeWeight(4);
    stroke(0, 255, 10);

    ellipse(xpos, ypos, dExtern, dExtern);
    ellipse(xpos, ypos, dIntern, dIntern);
  }
  
  void filling(int angleEnd)
  {
  
  }
}
