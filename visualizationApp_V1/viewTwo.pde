void viewTwo()
{
//  debug+=1;
//  println(debug);
  curView = 2;
  background(255);  // to have nice text
  
  imageMode(CENTER);
  image(face, width/2, height/3);
  
  /*
  * Display text
  */  
  
  textAlign(LEFT, TOP);
  textFont(H1, width/50);
  fill(palette[0]);
  text("LOCAL MEASURES", width/100, 10*height/800);
  text("AVERAGE", 10*width/200, 158*height/200);
  
  strokeWeight(width/400);
  stroke(palette[0]);
  line(width/200, height/200, 36*width/200, height/200);
  line(width/200, 10*height/200, 36*width/200, 10*height/200);
  line(width/200, 156*height/200, 36*width/200, 156*height/200);
  line(width/200, 166*height/200, 36*width/200, 166*height/200);
  
  /*
  * Display zones && prepare for average on view 3
  */
  nbMeasure = 0;
  sum = 0;
  sumAngle = 0;
  for(int i = 0; i < 6; i++)
  {
    if (angleValue[i] == 0)
      zones[i].display();
    else
    {
      zones[i].filled(angleValue[i]);
      zones[i].valueDisplay(value[i]);
      nbMeasure += 1; 
      sum += value[i];
      sumAngle += angleValue[i];
      avgMeasure = sum/nbMeasure;
      avgAngle = sumAngle/nbMeasure;
      avg.filled(avgAngle);
      avg.valueDisplay(int(avgMeasure));
    }
  }
  
  if (nbMeasure == 6)
  {
    imageMode(CORNER);
    image(click, width/2, 10*height/12);
    
    if (saveFrame == 0 && textMid == textNormal)
    {
      saveReport();
      saveFrame += 1;
    }
  }

  
  /*
  * Select the zone
  */  
  
  zones[zoneIndex].select();


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
    println(inString);
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
