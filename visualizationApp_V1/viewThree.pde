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

}
