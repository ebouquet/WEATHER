class Motif {
  float x;
  float y;
  float vy;
  float vx;
  color col;
  int etat=0;
  int t=10;
  int t1=1;
  int t2=2;
  String type="pluie";  // valeur par défaut sur pluie
  
  int timer=0; 
  int timerMax=100;
  boolean vent=false;

  //float axevent= map(m.wind_direction, 0, 180, 0, 100);

  //--------------------------------------------------------
  //CONSTRUCTEUR
  //--------------------------------------------------------
  Motif () {
    x= random(width);
    y=  random(height);
    vy= random (1, 3);
    vx = m.wind_speed/3;
    col = color(0);
  }

  void aff() {
    //if (type.equals("pluie"))pluie();
    if (type.equals("pluiepartielle"))pluiepartielle();
    if (type.equals("pluie"))pluie();
    if (type.equals("nuages"))nuages();  
    if (type.equals("petitebruine"))petitebruine();
    if (type.equals("bruine"))bruine();
    if (type.equals("grosnuages"))grosnuages();  
    if (type.equals("brouillard"))brouillard();
    if (type.equals("scatteredclouds"))scatteredclouds();
    if (type.equals("neige"))neige();
    if (type.equals("flocons"))flocons();
  }


  //---------------------------------------------------------
  //  PLUVIEUX
  //---------------------------------------------------------

  void pluie() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col); 
    rect(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }

  void pluiepartielle() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col, 70); 
    rect(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }

  void petitebruine() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col, 70); 
    rect(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }

  void bruine() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col); 
    rect(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }



  //---------------------------------------------------------
  //  NUAGEUX
  //---------------------------------------------------------


  void scatteredclouds() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col);
    rect(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }

  void nuages() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col);
    rect(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }

  void grosnuages() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col);
    rect(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }

  void brouillard() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col);
    rect(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }
  
  void neige() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col);
    ellipse(x, y, t1, t2);

    if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
    }
  }
  
    void flocons() {
    y+=vy;
    x+=vx;

    noStroke();
    fill(col);
    ellipse(x, y, t1, t2);
    
    if (vent==true) {
      timer++;
      if (timer>timerMax) { 
        timer=0;
        timerMax=int(random(100, 300)); 
        y=random(-1, 1); 
      }
    }
     if (y>p.py+height/2) {
      y=p.py-height/2;
      x=random(p.px-width, p.px+width);
      
    } 
  }
  
  
  
  
}