void viewThree()
{
  curView = 3;
  background(255);
  
  /*
  * Display text
  */  
  
  textAlign(LEFT, TOP);
  textFont(H1, width/50);
  fill(palette[0]);
  text("GLOBAL MEASURES", width/200, 10*height/800);

  
  strokeWeight(width/400);
  stroke(palette[0]);
  line(width/200, height/200, 36*width/200, height/200);
  line(width/200, 10*height/200, 36*width/200, 10*height/200);

  /*
  * Compute Average
  */  

  avgMeasure = 0;
  avgAngle = 0;
  avgMeasure = sum/nbMeasure;
  avgAngle = sumAngle/nbMeasure;
  

  
  if (nbMeasure == 0)
  {
    fill(palette[0]);
    textAlign(CENTER, CENTER);
    text("No Value Recorded", width/2, height/3);
  }
  else
  {
    avg.filling(avgAngle);
    avg.valueDisplay(avgMeasure);
  }
    
  textAlign(CENTER, CENTER);
  textFont(H1, width/20);
  fill(palette[0]);
  text("LEAVE US YOUR FEEDBACKS", width/2, 8*height/12);
  text("and your email :)", width/2, 9*height/12);
  text("www.ouiskin.com", width/2, 10*height/12);


  
  strokeWeight(4);
  stroke(palette[0]);
  line(width/8, 7*height/12, 7*width/8, 7*height/12);
  line(width/8, 11*height/12, 7*width/8, 11*height/12);

}
