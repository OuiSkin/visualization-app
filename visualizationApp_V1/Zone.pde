class Zone 
{

  // Declare variables
  float xpos;
  float ypos;
  int dExtern;
  int dIntern;
  int rgb;
  float angleStart;
  float angleMid;
  float angleEnd;
  
  // Constructor to set initial values
  Zone(float x, float y) 
  {
    xpos = x;
    ypos = y;
    rgb = 122;
    
    // Part ext
    dExtern = width/10;
    
    // Part Int
    dIntern = 3*dExtern/4;
    
    // arc
    angleStart = 0;
    angleMid = 0; 
    angleEnd = 0;
  }
  
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
  
  void filling(float angleCopy)
  { 
    angleEnd = angleCopy;
    angleMid += 0.05;
    angleMid = constrain(angleMid, angleStart, angleEnd); 
    
    fill(255);
    strokeWeight(4);
    stroke(0, 255, 10);

    ellipse(xpos, ypos, dExtern, dExtern);
    
    fill(palette[1]);
    arc(xpos, ypos, dExtern, dExtern, angleStart - PI/2, angleMid - PI/2);    
    
    fill(255);
    ellipse(xpos, ypos, dIntern, dIntern);
  }
}
