class Player {


  float px;
  float py;
  float vx =1;
  float vy=1;
  float vMax=5;
  float accel=1;
  float friction=0.95;
  float bound=0.9;

  float camX=0;
  float camY=0;

  //--------------------------------------------------------
  //CONSTRUCTEUR
  //--------------------------------------------------------
  Player(float px, float py) {
    this.px=px;
    this.py=py;
  }

  //--------------------------------------------------------
  //DRAW
  //--------------------------------------------------------
  void draw() {
    // camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
    camera(
      width/2.0+camX, 
      height/2.0+camY, 
      (height/2.0) / tan(PI*30.0 / 180.0), 
      width/2.0+camX, 
      height/2.0+camY, 
      0, 
      0, 1, 0
      );

    
    camX-=( camX - (px-width/2) )*0.05;
    camY-=( camY - (py-height/2) )*0.05;

    //-------------------------------------
    px+=vx;
    py+=vy;

    vy+=0.5;

    if(vx>vMax)vx=vMax;
    if(vx<-vMax)vx=-vMax;
    if(vy>vMax)vy=vMax;
    if(vy<-vMax)vy=-vMax;

    vx*=friction;
    vy*=friction;

    if (down)vy+=accel;
    if (up)vy-=accel;
    if (right)vx+=accel;
    if (left)vx-=accel;
    
    // On définit la couleur de l'ellipse
    fill(0);
    noStroke();
    ellipse(px, py, 30, 30);
  }
  float security=0.01;
  
  void collide(ArrayList<Bloc> t){
    
    for (int i=0; i<t.size(); i++) {
      if(t.get(i).inside(px,py+10)){
          vy*=-bound;
          while(t.get(i).inside(px,py+10))py-=security;
      }
    }
    
    for (int i=0; i<t.size(); i++) {
      if(t.get(i).inside(px,py-10)){  
        vy*=-bound;
        while(t.get(i).inside(px,py-10))py+=security;
      }
    }
    
    for (int i=0; i<t.size(); i++) {
      if(t.get(i).inside(px+10,py)){
          vx*=-bound;
          while(t.get(i).inside(px+10,py))px-=security;
      }
    }
    
    for (int i=0; i<t.size(); i++) {
      if(t.get(i).inside(px-10,py)){
          vx*=-bound;
          while(t.get(i).inside(px-10,py))px+=security;
      }
    }  
  }
  
  
  
  
  
}