void viewTwo()
{
  curView = 2;
  background(255);  // to have nice text
  
  /*
  * Display text
  */  
  
  textAlign(LEFT, TOP);
  textFont(H1, width/50);
  fill(palette[0]);
  text("LOCAL MEASURES", width/100, 10*height/800);

  
  strokeWeight(width/400);
  stroke(palette[0]);
  line(width/200, height/200, 36*width/200, height/200);
  line(width/200, 10*height/200, 36*width/200, 10*height/200);

  imageMode(CENTER);
  image(face, width/2, height/3);
  
  /*
  * Display zones
  */

  for(int i = 0; i < 6; i++)
  {
    if (angleValue[i] == 0)
      zones[i].display();
    else
    {
      zones[i].filled(angleValue[i]);
      zones[i].valueDisplay(value[i]); 
    }
  }

  
  /*
  * Select the zone
  */  
  
  zones[zoneIndex].select();
  
//  /*
//  * Key control
//  */  
//  
//  if(keyPressed == true)
//  {
//    zoneIndex = (zoneIndex+1)%6;
//    keyPressed = false;
//  }


  /*
  * Receives data of selected zone
  */
  
  inString = myPort.readStringUntil('\n');
  
  if (inString != null)  // if I receive something
  {
    inString = trim(inString);    
    value[zoneIndex] = float(inString);
    angleValue[zoneIndex] = value[zoneIndex] * 2 * PI / 100;
    inStringCount += 1;
  }

  /*
  * Fill the selected zone
  */
   
  
  if (value[zoneIndex] > 0)
  {
    zones[zoneIndex].filling(angleValue[zoneIndex]); 
    zones[zoneIndex].valueDisplay(value[zoneIndex]); 
  }

    
  /*
  * Go for next zone when filling is over
  */  
  if (zones[zoneIndex].angleMid == angleValue[zoneIndex] && angleValue[zoneIndex] != 0)
  {  
      zoneIndex = (zoneIndex + 1)%6;
  }
}
