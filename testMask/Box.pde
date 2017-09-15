class Box{
  int x, y;
  int wd, ht;
  color col, otln;
  boolean show, isControl;
  
  Box(int boxX, int boxY, int boxW, int boxH, color boxC, color boxO){
    x = boxX;
    y = boxY;
    wd = boxW;
    ht = boxH;
    col = boxC;
    otln = boxO;
    show = true;
    isControl = false;
  }
  
  void display(){
    if(show){
      if(isControl){
        strokeWeight(10);
      }
      else{
        strokeWeight(1);
      }
      fill(col);
      stroke(otln);
      rect(x,y,wd,ht);
    }
  }
  
  boolean isPressed(int mx, int my){
    return ((mx > x) && (mx < x+wd) && (my>y) && (my<y+ht));
  }
  
}