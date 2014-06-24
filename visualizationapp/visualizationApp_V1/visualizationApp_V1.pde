/*
 *  
 *  Works with uploaded pseudocodeForProcessing.cpp script
 *
 *  @file 
 *  @author Benoit Cotte
 */

import processing.serial.*;

// The serial port
Serial myPort;

Zone zone1;

float value;

void setup ()
{
  /*
  *  Deal with the Serial connection
  */
  
  println(Serial.list());    // List all the available serial ports:
  myPort = new Serial(this, Serial.list()[5], 9600);   
  myPort.clear();  // clear buffer if any remaining values
  
  /*
  *  Setup characteristics
  */
  
  size(1200, 800);  // dim of the window

  background(255);  // set inital background color
  
  fill(52, 142, 246);  // default fill
  
  stroke(255);
  
  smooth();
  
  /*
  *  Instantiate the zones
  */
  zone1 = new Zone("Zone 1", 1);

  
}

void draw ()
{
  background(80);
  
  viewTwo();
  
}





