void viewTwo()
{
  curView = 2;

  /*
  * Display zones
  */
  if (viewtwoRun == 0)
  {    
    background(255);
    zones[0].display();
    zones[1].display();
    zones[2].display();
    zones[3].display();
    zones[4].display();
    zones[5].display();
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
  
//  inString = myPort.readStringUntil('\n');
  
  if (inString != null)  // if I receive something
  {
    inString = trim(inString);    
    value[zoneIndex] = float(inString);
    angleValue[zoneIndex] = value[zoneIndex] * PI / 100;
    inStringCount += 1;
  }

  /*
  * Fill the selected zone
  */
  zones[zoneIndex].filling(angleValue[zoneIndex]); 
    
  /*
  * Go for next zone when filling is over
  */  
  if (zones[zoneIndex].angleMid == angleValue[zoneIndex] && angleValue[zoneIndex] != 0)
  {  
      zoneIndex = (zoneIndex + 1)%6;
  }

  viewtwoRun ++;
}
