void viewOne()
{
  curView = 1;
  
  background(255);  // to have nice text
  
  /*
  * For Text
  */
  textAlign(CENTER, CENTER);
  textFont(H1, width/25);
  fill(palette[0]);
  text("Ouiskin aims at enhancing your cosmetics routine", width/2, height/12);
  
  textAlign(CENTER, CENTER);
  textFont(H1, width/20);
  fill(palette[0]);
  text("MEASURE YOUR SKIN HYDRATION LEVEL", width/2, 5*height/12);
  text("with hexa", width/2, 6*height/12);

  
  strokeWeight(4);
  stroke(palette[0]);
  line(width/8, 4*height/12, 7*width/8, 4*height/12);
  line(width/8, 7*height/12, 7*width/8, 7*height/12);
  
  /*
  * For img
  */ 
  image(click, width/2, 10*height/12);

}
