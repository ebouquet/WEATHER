class Bloc{
  float x=0;
  float y=0;
  float w=0; 
  float h=0;

  Bloc(float _x,float _y,float _w,float _h){  
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }

  void draw(){
    rect(x,y,w,h);
  }
  
  boolean inside(float px,float py){
    if(px>x && px<x+w && py>y && py<y+h){
      return true;
    } else{
      return false;
    }
  }
  
}