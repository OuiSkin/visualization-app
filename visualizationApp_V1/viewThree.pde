void viewThree()
{
  curView = 3;
  background(255);
  
  /*
  * Display text
  */  
    
  textAlign(CENTER, CENTER);
  textFont(H1, width/20);
  fill(palette[0]);
  text("Enter your email", width/2, 5*height/12);
  fill(palette[1]);
  text("GET YOUR REPORT", width/2, 6*height/12);
  fill(palette[0]);
  text("www.ouiskin.com", width/2, 7*height/12);


  
  strokeWeight(4);
  stroke(palette[0]);
  line(width/8, 4*height/12, 7*width/8, 4*height/12);
  line(width/8, 8*height/12, 7*width/8, 8*height/12);

}
