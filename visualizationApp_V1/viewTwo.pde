void viewTwo()
{
  /*
  * Draw empty zones
  */
  background(255);

  zones[0].display();
  zones[1].display();
  zones[2].display();
  zones[3].display();
  zones[4].display();
  zones[5].display();
  
  zones[0].select();
  
  /*
  * Receives
  */
  String inString = myPort.readStringUntil('\n');
  if (inString != null)
  {
    inString = trim(inString);
    value = float(inString);
  }
}
