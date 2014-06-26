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
int curView;
int inStringCount;

String inString;
int viewtwoRun;

/*
*  Graphic elements
*/
PImage logo;
PImage click;
color[] ouiskin = {#555555, #4291FF, #1AAA6A, #DD4234};
color[] palette = ouiskin;
PFont H1;



void setup ()
{
  /*
  *  Deal with the Serial connection
  */
  
  println(Serial.list());    // List all the available serial ports:
//  myPort = new Serial(this, Serial.list()[5], 9600);   
//  myPort.clear();  // clear buffer if any remaining values

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
  curView = 0;
  inStringCount = 0;
  
  /*
  *  Initialize the graph components
  */  
  logo = loadImage("logo.gif");
  H1 = createFont("OpenSans-Light.ttf", 16, true);
//  face = loadImage("faceClean.png");
  click = loadImage("clicktoContinue.png");
  
  
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
      reset();
  }

}

void keyPressed()
{
  if(keyCode == ENTER)
    reset();
}

/*
*  Reset zone values
*/
void reset()
{
 for(int i = 0; i < 6; i ++)
    {
      value[i] = 0;
      angleValue[i] = 0;
    }
  zoneIndex = 0;
  viewtwoRun = 0;  // reinitializes if go back to view2 
}

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
