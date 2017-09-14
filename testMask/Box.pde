class Box{
  int x, y;
  int wd, ht;
  color col, otln;
  boolean show;
  
  Box(int boxX, int boxY, int boxW, int boxH, color boxC, color boxO){
    x = boxX;
    y = boxY;
    wd = boxW;
    ht = boxH;
    col = boxC;
    otln = boxO;
    show = true;
  }
  
  void display(){
    if(show){
      fill(col);
      stroke(otln);
      rect(x-wd/2,y-ht/2,wd,ht);
    }
  }
}