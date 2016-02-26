boolean up=false;
boolean down=false;
boolean left=false;
boolean right=false;

void keyPressed() {  
  if (keyCode==38)up=true;  
  if (keyCode==40)down=true;  
  if (keyCode==37)left=true;  
  if (keyCode==39)right=true;

  if (key=='a')m.tryToFind("Montreal");  
  if (key=='z')m.tryToFind("Inverness");   
  if (key=='e')m.tryToFind("York");   
  if (key=='k')m.tryToFind("Pekin");
}

void keyReleased() {
  if (keyCode==38)up=false;
  if (keyCode==40)down=false;
  if (keyCode==37)left=false;
  if (keyCode==39)right=false;

  //---------------------------------------------------------
  //  PLUVIEUX
  //---------------------------------------------------------

  if (key=='q') {
    m.condi_code=11;
    for (int i=0; i<pluiepartielle.length; i++) {
      pluiepartielle[i].y=random(p.py-height/2, p.py+height/2);
    }
  }

  if (key=='s') {
    m.condi_code=12;
    for (int i=0; i<pluie.length; i++) {
      pluie[i].y=random(p.py-height/2, p.py+height/2);
    }
  }

  if (key=='d') {
    m.condi_code=9;
    for (int i=0; i<petitebruine.length; i++) {
      petitebruine[i].y=random(p.py-height/2, p.py+height/2);
    }
  }

  if (key=='f') {
    m.condi_code=8;
    for (int i=0; i<bruine.length; i++) {
      bruine[i].y=random(p.py-height/2, p.py+height/2);
    }
  }

  //---------------------------------------------------------
  //  ORAGEUX
  //---------------------------------------------------------

  // IF ISOLATED THUNDERSTORMS
  if (key=='p')m.condi_code=47;

  // IF THUNDERSTORMS
  if (key=='o')m.condi_code=4;

  // IF SEVERE THUNDERSTORMS
  if (key=='i')m.condi_code=3;

  //---------------------------------------------------------
  //  NUAGEUX
  //---------------------------------------------------------

  //  IF PARTLY CLOUDY   
  if (key=='r') {
    m.condi_code=30;
    for (int i=0; i<scatteredclouds.length; i++) {
      scatteredclouds[i].y=random(p.py-height/2, p.py+height/2);
    }
  }

  //  IF CLOUDY
  if (key=='y'){
    m.condi_code=26;
    for (int i=0; i<nuages.length; i++) {
      nuages[i].y=random(p.py-height/2, p.py+height/2);
    }
  }

  //  IF MOSTLY CLOUDY   
  if (key=='t'){
    m.condi_code=28;
    for (int i=0; i<grosnuages.length; i++) {
      grosnuages[i].y=random(p.py-height/2, p.py+height/2);
    }
  }

  // IF FOG  
  if (key=='u')m.condi_code=20;

  //---------------------------------------------------------
  //  NEIGEUX
  //---------------------------------------------------------

  // IF SNOW 
  if (key=='h') {
    m.condi_code=16;
    for (int i=0; i<neige.length; i++) {
      neige[i].y=random(p.py-height/2, p.py+height/2);
    }
  }
  
    // IF LIGHT SNOW 
  if (key=='g') {
    m.condi_code=14;
    for (int i=0; i<flocons.length; i++) {
      flocons[i].y=random(p.py-height/2, p.py+height/2);
    }
  }
  
  
  
  
}