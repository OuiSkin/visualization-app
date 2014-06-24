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
int zoneIndex;
int clickCounter;
float[] value = new float[6];
float[] angleValue = new float[6];

String inString;
int viewtwoRun;
PImage logo;

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
  
  size(800, 800);  // dim of the window
      
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
  zoneIndex = 0;
  inString = null;
  int viewtwoRun =0;
  logo = loadImage("logo.gif");

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




