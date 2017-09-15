import g4p_controls.*;
import java.util.ArrayList;
import java.awt.Font;

// make global variables
boolean baseShow = false;
PFont f;
Box base;
Box mask;
Box ctrl;
ArrayList<Box> boxes;
ArrayList<Box> mboxes;

void setup(){
  // draw full screen
  size(1280,720);
  
  // set the font
  f = createFont("Verdana",24);
  textFont(f);
  textAlign(CENTER,CENTER);
  
  // keep track of boxes on screen
  boxes = new ArrayList<Box>();
  
  // keep track of boxes part of the mask
  mboxes = new ArrayList<Box>();
  
  // initial base 'wafer'
  base = new Box(120,500,420,100,200,279);
  
  // initial mask block
  mask = new Box(120,100,10,100,color(20,30,90),color(255,0,0));

  // keep track of initials
  boxes.add(base);
  mboxes.add(mask);
  
  // set active mask to intial one
  ctrl = mask;
  ctrl.isControl = true;
  
  // set GUIs
  createGUI();
  customGUI();
}

void draw(){
  // draw backgroun
  color c = color(100,255/4,255/8);
  background(c);
  
  drawCanvas();
  
  // display boxes
  for(Box a: mboxes){
    a.display();
  }
  for(Box a: boxes){
    a.show = true;
    a.display();
  }
}

void drawCanvas(){
  // draw gray box to separate working area from ui
  stroke(255);
  fill(color(230));
  rect(50,50,580,610);
}

void makeNewMaskBox(){
  // makes new block to be used in the mask
  Box x = new Box(120,100,10,100,color(random(225),random(225),random(225)),color(255,0,0));
  // Make new block adjustable
  makeActiveBox(x);
  // keeps track of new block
  mboxes.add(x);
  
  // update gui slider
  widSlid.setValue(100);
  posSlid.setValue(190);
}

void customGUI(){
  // adjusts the GUI from G4P
  
  // Make font more readable
  Font font = new Font("Verdana", Font.BOLD,24);
  newLayerButton.setFont(font);
  widLab.setFont(font);
  posLab.setFont(font);
}

void makeActiveBox(Box b){
  // allows outline to highlight box that will be changed by sliders
  ctrl.isControl = false;
  ctrl = b;
  ctrl.isControl = true;
  
  // adjust gui sliders
  widSlid.setValue(ctrl.wd);
  posSlid.setValue(ctrl.x); 
}

void mousePressed(){
  // this function is called ONCE when the mouse is pressed
  
  // check if a box should be made active
  for(Box a : mboxes){
    if(a.isPressed(mouseX,mouseY)){
      makeActiveBox(a);
      break;
    }
  }
}