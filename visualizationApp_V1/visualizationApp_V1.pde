/*
 *  
 *  Works with uploaded pseudocodeForProcessing.cpp script
 *
 *  @file 
 *  @author Benoit Cotte
 */


import processing.serial.*;

Serial myPort;

Zone[] zones;
int clickCounter;

void setup ()
{
  /*
  *  Deal with the Serial connection
  */
  
//  println(Serial.list());    // List all the available serial ports:
//  myPort = new Serial(this, Serial.list()[5], 9600);   
//  myPort.clear();  // clear buffer if any remaining values
  
  /*
  *  Instantiate the zones
  */
  
  zones = new Zone[6];
  zones[0] = new Zone(width/2, height/5);
  zones[1] = new Zone(width/5, 3*height/5);
  zones[2] = new Zone(2*width/5, 2*height/5);
  zones[3] = new Zone(3*width/5, 2*height/5);
  zones[4] = new Zone(4*height/5, 3*height/5);
  zones[5] = new Zone(width/2, 4*height/5);
  
  
  /*
  *  Initialize the variables
  */
  
  clickCounter = 0;

  /*
  *  Setup characteristics
  */
  
  size(1200, 800);  // dim of the window

  background(255);  // set inital background color
  
  fill(52, 142, 246);  // default fill
  
  stroke(255);
  
  smooth();
}

void draw ()
{
  if (clickCounter == 0)
    viewOne();
  
  else if (clickCounter == 1)
    viewTwo();
  
  else
    viewThree();
  
}

void mousePressed()
{
  if (mousePressed && (mouseButton == LEFT))
    clickCounter += 1;
   
  else if (mousePressed && (mouseButton == RIGHT))
    clickCounter -= 1;

}




