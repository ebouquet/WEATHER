Parser parser;
Player p;
Meteo m;

//-------------------------------------
// TABLEAUX
//-------------------------------------
Motif [] pluiepartielle = new Motif [2000];
Motif [] pluie = new Motif [4000];
Motif [] petitebruine = new Motif [2000];
Motif [] bruine = new Motif [4000];

Motif [] scatteredclouds= new Motif [500];
Motif [] nuages=new Motif [1500];
Motif [] grosnuages= new Motif [2000];
Motif [] brouillard = new Motif [2500];

Motif [] neige = new Motif [1200];
Motif [] flocons=new Motif [50];
//Motif [] heavysnow = new Motif [1000];


void setup() {
  //size(800, 800, P3D);
  fullScreen(P3D);
  frameRate(60);

  parser = new Parser(loadShape("level.svg"));
  p = new Player(width/2-200, height/2-200);
  m = new Meteo();
  m.tryToFind("Chicago");

  //-------------------------------------
  // LOAD
  //-------------------------------------

  //---------------------------------------------------------
  //  PLUVIEUX
  //---------------------------------------------------------

  for (int i=0; i<pluiepartielle.length; i++) {
    pluiepartielle[i]= new Motif();
    pluiepartielle[i].vy = random(5, 10);
    pluiepartielle[i].t1=2;
    pluiepartielle[i].t2=4;
  }

  for (int i=0; i<pluie.length; i++) {
    pluie[i]=new Motif();
    pluie[i].vy = random(5, 10);
    pluie[i].t1=2;
    pluie[i].t2=4;
  }

  for (int i=0; i<petitebruine.length; i++) {
    petitebruine[i]=new Motif();
    petitebruine[i].vy= random (15, 20);
    petitebruine[i].t1=2;
    petitebruine[i].t2=2;
  }

  for (int i=0; i<bruine.length; i++) {
    bruine[i]=new Motif();
    bruine[i].vy= random (15, 25);
    bruine[i].vx= random (-10, 10);
    bruine[i].t1=2;
    bruine[i].t2=2;
  }  

  //---------------------------------------------------------
  //  NUAGEUX
  //---------------------------------------------------------

  for (int i=0; i<scatteredclouds.length; i++) {
    scatteredclouds[i]= new Motif();
    scatteredclouds[i].vy = random(-0.1, 0.1);
    scatteredclouds[i].vx = random(-0.1, 0.1);
    scatteredclouds[i].col = color(0, 3);
    scatteredclouds[i].t1 =70;
    scatteredclouds[i].t2 =20;
  }

  for (int i=0; i<nuages.length; i++) {
    nuages[i]= new Motif();
    nuages[i].vy = random(-0.1, 0.1);
    nuages[i].vx = random(-0.1, 0.1);
    nuages[i].col = color(0, 6);
    nuages[i].t1 =70;
    nuages[i].t2 =20;
  }

  for (int i=0; i<grosnuages.length; i++) {
    grosnuages[i]= new Motif();
    grosnuages[i].vy = random(-0.1, 0.1);
    grosnuages[i].vx = random(-0.1, 0.1);
    grosnuages[i].col = color(0, 10);
    grosnuages[i].t1 =70;
    grosnuages[i].t2 =20;
  }

  for (int i=0; i<brouillard.length; i++) { 
    brouillard[i] = new Motif(); 
    brouillard[i].vy = random(-0.3, 0.3);
    brouillard[i].vx =random(-0.3, 0.3);
    brouillard[i].col = color(0, 5);
    brouillard[i].t1 =70;
    brouillard[i].t2 =20;
  }

  //---------------------------------------------------------
  //  NEIGEUX
  //---------------------------------------------------------

  for (int i=0; i<neige.length; i++) { 
    neige[i] = new Motif(); 
    neige[i].vy = random(0, 10);
    neige[i].vx =random(0, 0.5);
    neige[i].col = color(0);
    neige[i].t1 =5;
    neige[i].t2 =5;
  }
  for (int i=0; i<flocons.length; i++) { 
    flocons[i] = new Motif(); 
    flocons[i].vy = random(-5, 0);
    flocons[i].col = color(0);
    flocons[i].t1 =3;
    flocons[i].t2 =3;
    flocons[i].vent=true;
  }


  //---------------------------------------------------------
  //  GRELEUX
  //---------------------------------------------------------


  //---------------------------------------------------------
  //  BEAU TEMPS
  //---------------------------------------------------------
}



//-------------------------------------
// VARIABLES
//-------------------------------------

// THUNDERSTORM
float t=0;
float  tMax=200;
int colBackground=200;



void draw() {
  background(colBackground);
  if (colBackground<200)colBackground+=20;
  //shape(p,0,0);  
  p.draw();
  parser.draw();
  p.collide(parser.tabBloc);

  //---------------------------------------------------------
  //  DISPLAY
  //---------------------------------------------------------

  //---------------------------------------------------------
  //  PLUVIEUX
  //---------------------------------------------------------

  // IF LIGHT RAIN
  if (m.condi_code==11) {
    for (int i=0; i<pluiepartielle.length; i++) {
      pluiepartielle[i].aff();
      pluiepartielle[i].type="pluiepartielle";
    }
  } 

  // IF RAIN
  if (m.condi_code==12) {
    for (int i=0; i<pluie.length; i++) {
      pluie[i].aff();
      pluie[i].type="pluie";
    }
  } 

  // IF LIGHT DRIZZLE
  if (m.condi_code==9) {
    for (int i=0; i<petitebruine.length; i++) {
      petitebruine[i].aff();
      petitebruine[i].type="petitebruine";
    }
  }

  // IF DRIZZLE
  if (m.condi_code==8) {
    for (int i=0; i<bruine.length; i++) {
      bruine[i].aff();
      bruine[i].type="bruine";
    }
  }

  //---------------------------------------------------------
  //  ORAGEUX
  //---------------------------------------------------------


  // IF ISOLATED THUNDERSTORMS
  if (m.condi_code==47) {
    t+=0.5;
    if (t>tMax) {
      colBackground=0;
      tMax=random(150, 300);
      t=0;
    }
  }

  // IF THUNDERSTORMS
  if (m.condi_code==4) {
    t+=1;
    if (t>tMax) {
      colBackground=0;
      tMax=random(150, 300);
      t=0;
    }
  }

  // IF SEVERE THUNDERSTORMS
  if (m.condi_code==3) {
    t+=2;
    if (t>tMax) {
      colBackground=0;
      tMax=random(0, 100);
      t=0;
    }
  } 

  /* // IF RAIN AND THUNDER
   if (m.condi_text=="Light Rain with Thunder") {
   fill(255,0,0);
   rect(20, 20, 30, 30);
   } */


  //---------------------------------------------------------
  //  NUAGEUX
  //---------------------------------------------------------

  // IF PARTLY CLOUDY (NIGHT & DAY)
  if (m.condi_code==29 || m.condi_code==30) {
    for (int i=0; i<scatteredclouds.length; i++) {
      nuages[i].aff();
      nuages[i].type="scatteredclouds";
    }
  }

  // IF CLOUDY
  if (m.condi_code==26) {
    for (int i=0; i<nuages.length; i++) {
      nuages[i].aff();
      nuages[i].type="nuages";
    }
  }

  // IF MOSTLY CLOUDY (NIGHT & DAY)
  if (m.condi_code==27 || m.condi_code==28) {
    for (int i=0; i<grosnuages.length; i++) {
      grosnuages[i].aff();
      grosnuages[i].type="grosnuages";
    }
  }

  // IF FOG OR HAZE OR SMOKY
  if (m.condi_code==20 || m.condi_code==21 || m.condi_code==23) {
    for (int i=0; i<brouillard.length; i++) {
      brouillard[i].aff();
      brouillard[i].type="brouillard";
    }
  }

  //---------------------------------------------------------
  //  NEIGEUX
  //---------------------------------------------------------

  // IF SNOW OR SNOW SHOWERS
  if (m.condi_code==16 || m.condi_code==46) {
    for (int i=0; i<neige.length; i++) {
      neige[i].aff();
      neige[i].type="neige";
    }
  }

  // IF HEAVY SNOW



  // IF SNOW FLURRIES (rafales) OR BLOWING SNOW



  // IF LIGHT SNOW SHOWERS OR SCATTERED SNOW SHOWERS OR SLEET (neige fondue)
  if (m.condi_code==14 || m.condi_code==42) {
    for (int i=0; i<flocons.length; i++) {
      flocons[i].aff();
      flocons[i].type="flocons";
    }
  }

  //---------------------------------------------------------
  //  GRELEUX
  //---------------------------------------------------------

  // IF HAIL
  // IF MIXED RAIN AND HAIL

  //---------------------------------------------------------
  //  BEAU TEMPS
  //---------------------------------------------------------

  // IF CLEAR (NIGHT) OR SUNNY OR FAIR (NIGHT & DAY) OR IF HOT
  if (m.condi_code==31 || m.condi_code==32 || m.condi_code==33 || m.condi_code==34) {
  }


  //-------------------------------------
  // TEMPORAIRE : Etat actuel météo 
  //-------------------------------------

  camera();
  fill(0);
  textSize(25);
  text(m.condi_text, 30, 30);
  text(m.condi_code, 30, 100); 
}