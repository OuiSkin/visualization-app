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

int i = 0%6;
Zone[] zones;

float value;

int control = 0;


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
  
  size(800, 600);  // dim of the window

  background(255);  // set inital background color
  
  fill(52, 142, 246);  // default fill
  
  stroke(255);
  
  smooth();
  
  background(80);

  
  /*
  *  Instantiate the zones
  */
  zones = new Zone[6];
  zones[0] = new Zone("Zone 1", 0);
  zones[1] = new Zone("Zone 2", 0);
  zones[2] = new Zone("Zone 3", 0);
  zones[3] = new Zone("Zone 4", 0);
  zones[4] = new Zone("Zone 5", 0);
  zones[5] = new Zone("Zone 6", 0);

}

void draw ()
{
  viewTwo(i);
  println(zones[i].x); 
}





