class Parser {

  ArrayList<Bloc> tabBloc;

  Parser(PShape p) {
    tabBloc = new ArrayList<Bloc>();
  
    for (int i=0; i<p.getChildCount(); i++) {
      PShape s = p.getChild(i);
      if (s.getKind() == RECT ) {
        float [] param = s.getParams();
        //println(param);
        tabBloc.add(new Bloc(param[0], param[1], param[2], param[3]));
      }
    }
  }

  void draw() {
    for (int i=0; i<tabBloc.size(); i++) {
      tabBloc.get(i).draw();
    }
  }
    
}