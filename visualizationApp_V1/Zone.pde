class Zone 
{

  // Declare variables
  float xpos;
  float ypos;
  int dExtern;
  int dIntern;
  float angleStart;
  float angleMid;
  float angleEnd;
  float textBig;
  float textMid;
  float textNormal;
  
  // Constructor to set initial values
  Zone(float x, float y) 
  {
    xpos = x;
    ypos = y;
    
    // Part ext
    dExtern = width/15;
    
    // Part Int
    dIntern = 3*dExtern/4;
    
    // arc
    angleStart = 0;
    angleMid = 0; 
    angleEnd = 0;
    
    textBig = 40;
    textMid = 40;
    textNormal = 16;
  }
  
  // Draw the zone
  void display() 
  { 
    fill(255);
    strokeWeight(width/1000);    
    stroke(palette[0]);
    
    ellipse(xpos, ypos, dExtern, dExtern);
    ellipse(xpos, ypos, dIntern, dIntern);
  }
  
  // Make the zone green
  void select()
  {
    fill(255);
    strokeWeight(width/400);
    stroke(palette[1]);

    ellipse(xpos, ypos, dExtern, dExtern);
    ellipse(xpos, ypos, dIntern, dIntern);
  }
  
  void filling(float angleCopy)
  { 
    angleEnd = angleCopy;
    angleMid += 0.05;
    angleMid = constrain(angleMid, angleStart, angleEnd); 

    ellipse(xpos, ypos, dExtern, dExtern);
    
    fill(palette[1]);
    arc(xpos, ypos, dExtern, dExtern, angleStart - PI/2, angleMid - PI/2);    
    
    fill(255);
    ellipse(xpos, ypos, dIntern, dIntern);
  }
  
  void filled(float angleEnd)
  { 
    fill(255);
    ellipse(xpos, ypos, dExtern, dExtern);
    
    fill(palette[1]);
    arc(xpos, ypos, dExtern, dExtern, angleStart - PI/2, angleEnd - PI/2);    
    
    fill(255);
    ellipse(xpos, ypos, dIntern, dIntern);
  }
  
  void valueDisplay(float valueCopy)
  {
    fill(palette[0]);
    textMid -= 0.5;
    textMid = constrain(textMid, textNormal, textBig); 
    textSize(textMid);  
    textAlign(CENTER, CENTER);
    String valueDisplay = nf(valueCopy, 0, 0) + "%";
    text(valueDisplay, xpos, ypos);
  }
  
  void reset(int i)
  {
    value[i] = 0;
    angleValue[i] = 0;
    
    angleStart = 0;
    angleMid = 0; 
    angleEnd = 0;
    
    textBig = 40;
    textMid = 40;
    textNormal = 16;
  }
}
