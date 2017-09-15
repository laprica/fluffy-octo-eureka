class Box{
  // allows for display of rectangles on the screen
  // to represent substrate, layer, mask, etc
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
    // only display if should be shown
    // an outline will show if it is the active block
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
    // check if the mouse cursor is within the bounds of the box
    return ((mx > x) && (mx < x+wd) && (my>y) && (my<y+ht));
  }
  
}