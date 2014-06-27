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
AvgZone avg;
int z0Xpos, z0Ypos, z1Xpos, z1Ypos, z2Xpos, z2Ypos, z3Xpos, z3Ypos, z4Xpos, z4Ypos, z5Xpos, z5Ypos;
int zoneIndex;
int clickCounter;
float[] value = new float[6];
float[] angleValue = new float[6];
int curView;
int inStringCount;
float sum;
float sumAngle;
int nbMeasure;
float avgMeasure;
float avgAngle;
int saveFrame;


String inString;
String strAvgMeasure;

/*
*  Graphic elements
*/
PImage logo;
PImage click;
PImage face;
color[] ouiskin = {#555555, #3DBDEB, #1AAA6A, #DD4234};
color[] palette = ouiskin;
PFont H1;



void setup ()
{
  /*
  *  Deal with the Serial connection
  */
  
  println(Serial.list());    // List all the available serial ports:
  myPort = new Serial(this, Serial.list()[6], 9600);   
  myPort.clear();  // clear buffer if any remaining values

  /*
  *  Setup characteristics
  */
  
  size(800, 800);  // dim of the window
      
  /*
  *  Instantiate the zones
  */
  z0Xpos = width/2;
  z0Ypos = height/8;
  z1Xpos = 3*width/10;
  z1Ypos = 5*height/10;
  z2Xpos = 4*width/10;
  z2Ypos = 7*height/16;
  z3Xpos = 3*width/5;
  z3Ypos = 7*height/16;
  z4Xpos = 7*width/10;
  z4Ypos = 5*height/10;
  z5Xpos = width/2;
  z5Ypos = 6*height/8;

  zones = new Zone[6];
  zones[0] = new Zone(z0Xpos, z0Ypos);
  zones[1] = new Zone(z1Xpos, z1Ypos);
  zones[2] = new Zone(z2Xpos, z2Ypos);
  zones[3] = new Zone(z3Xpos, z3Ypos);
  zones[4] = new Zone(z4Xpos, z4Ypos);
  zones[5] = new Zone(z5Xpos, z5Ypos);
  
  avg = new AvgZone(width/2, height/3);
  
  
  /*
  *  Initialize the variables
  */
  
  clickCounter = 0;
  zoneIndex = 0;
  inString = null;
  curView = 0;
  inStringCount = 0;
  avgMeasure = 0;
  saveFrame = 0;
  
  /*
  *  Initialize the graph components
  */  
  logo = loadImage("logo.gif");
  H1 = createFont("OpenSans-Light.ttf", 16, true);
  click = loadImage("clicktoContinue.png");
  face = loadImage("faceClean800.png");
  
  
}

void draw ()
{
  if (clickCounter == 0)
    viewOne();
  
  else if (clickCounter == 1)
    viewTwo();
  
  else if (clickCounter == 2)
    viewThree();
  
}

void mousePressed()
{
  
  if (mousePressed && (mouseButton == RIGHT))
  {
    clickCounter = (clickCounter - 1)%3;
    review();
  }
   
  else if (mousePressed && (mouseButton == LEFT))
  {
    clickCounter = (clickCounter + 1)%3;
    if (curView == 1)
    {  
      for (int i = 0; i < 6; i ++)
      {    
        zones[i].reset(i);
      }
      zoneIndex = 0;
    }
  }

}

void keyPressed()
{
  if(keyCode == ENTER)  // Reset all
  {
    for (int i = 0; i < 6; i ++)
    {    
      zones[i].reset(i);
      zoneIndex = 0;
    }
  }
  if(keyCode == LEFT)  // Reset previous
  {
    if(zoneIndex != 0)
    {
      zones[zoneIndex - 1].reset(zoneIndex - 1);
      zoneIndex -= 1;
    }
    else
      zones[0].reset(0);
  }
}

/*
*  Reset zone values
*/

/*
*  Review zone values
*/
void review()
{
  background(255);
  for(int i = 0; i < 6; i ++)
  {
    zones[i].display();
    zones[i].filling(angleValue[i]);
  }
}
