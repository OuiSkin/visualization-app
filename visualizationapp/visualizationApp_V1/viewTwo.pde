void viewTwo(int curZone)
{
  /*
  * Receives
  */

  String inString = myPort.readStringUntil('\n');
  
  if (inString != null)   // check if there is something
  {
    inString = trim(inString);      // trim off any whitespace
    value = float(inString);        // convert to an float

    println(value);  
    
    zones[curZone].angleEnd = value*2*PI/100;
    println(zones[curZone].angleEnd);
    
    i ++;
    zones[curZone].x += 200;
    control = 1;
   }
  
  /*
  * Update
  */      
  if(control>0)
{  
  zones[curZone].update();
  
  /*
  * Display
  */          
  zones[curZone].display();  
}

}
