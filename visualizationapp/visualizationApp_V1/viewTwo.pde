void viewTwo()
{
  /*
  * Receives
  */

  String inString; 
  
  do
  {
    inString = myPort.readStringUntil('\n');    // get the ASCII string
    
   if (inString != null)   // check if there is something
   {
      // trim off any whitespace
      inString = trim(inString);
      // convert to an float
      value = float(inString);
      println(value);
      zone1.angleEnd = (value*PI)/100;
   }
  }
  while (inString == null);   // check if there is something
  
  
  // Update
  
  zone1.update();
  zone1.display();  
}
