class AvgZone 
{

  // Declare variables
  float xposAvg;
  float yposAvg;
  int dExternAvg;
  int dInternAvg;
  float angleStartAvg;
  float angleMidAvg;
  float angleEndAvg;
  float textBigAvg;
  float textMidAvg;
  float textNormalAvg;
  
  // Constructor to set initial values
  AvgZone(float x, float y) 
  {
    xposAvg = x;
    yposAvg = y;
    
    // Part ext
    dExternAvg = width/3;
    
    // Part Int
    dInternAvg = 3*dExternAvg/4;
    
    // arc
    angleStartAvg = 0;
    angleMidAvg = 0; 
    angleEndAvg = 0;
    
    textBigAvg = 80;
    textMidAvg = 80;
    textNormalAvg = 60;
  }
  
  void filling(float angleCopy)
  { 
    fill(255);
 
    angleEndAvg = angleCopy;
    angleMidAvg += 0.01;
    angleMidAvg = constrain(angleMidAvg, angleStartAvg, angleEndAvg); 
    
    strokeWeight(width/400);
    stroke(palette[1]);
    
    ellipse(xposAvg, yposAvg, dExternAvg, dExternAvg);
    
    fill(palette[1]);
    arc(xposAvg, yposAvg, dExternAvg, dExternAvg, angleStartAvg - PI/2, angleMidAvg - PI/2);    
    
    fill(255);
    ellipse(xposAvg, yposAvg, dInternAvg, dInternAvg);
  }
  
  void filled(float angleEnd)
  { 
    fill(255);
    
    strokeWeight(width/400);
    stroke(palette[1]);
    
    ellipse(xposAvg, yposAvg, dExternAvg, dExternAvg);
    
    fill(palette[1]);
    arc(xposAvg, yposAvg, dExternAvg, dExternAvg, angleStartAvg - PI/2, angleEndAvg - PI/2);    
    
    fill(255);
    ellipse(xposAvg, yposAvg, dInternAvg, dInternAvg);
  }
  
  void valueDisplay(float valueCopy)
  {
    fill(palette[0]);
    textMidAvg -= 0.5;
    textMidAvg = constrain(textMidAvg, textNormalAvg, textBigAvg); 
    textSize(textMidAvg);  
    textAlign(CENTER, CENTER);
    String valueDisplayAvg = nf(valueCopy, 0, 0) + "%";
    text(valueDisplayAvg, xposAvg, yposAvg);
  }
  
}
