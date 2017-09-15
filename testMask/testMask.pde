import g4p_controls.*;
import java.util.ArrayList;
import java.awt.Font;

boolean baseShow = false;
PFont f;
Box base;
Box mask;
Box ctrl;
ArrayList<Box> boxes;
ArrayList<Box> mboxes;

void setup(){
  size(1280,720);
  f = createFont("Verdana",24);
  textFont(f);
  textAlign(CENTER,CENTER);
  base = new Box(120,500,420,100,200,279);
  mask = new Box(120,100,10,100,color(20,30,90),color(255,0,0));
  ctrl = mask;
  boxes = new ArrayList<Box>();
  mboxes = new ArrayList<Box>();
  boxes.add(base);
  mboxes.add(mask);
  createGUI();
  customGUI();
}

void draw(){
  color c = color(100,255/4,255/8);
  background(c);
  drawCanvas();
  //update(mouseX,mouseY);
  //base.display();
  for(Box a: mboxes){
    a.display();
  }
  for(Box a: boxes){
    a.show = true;
    a.display();
  }
  
}

void drawCanvas(){
  stroke(255);
  fill(color(230));
  rect(50,50,580,610);
}

void makeNewMaskBox(){
  Box x = new Box(120,100,10,100,color(random(225),random(225),random(225)),color(255,0,0));
  makeActiveBox(x);
  mboxes.add(ctrl);
  widSlid.setValue(100);
  posSlid.setValue(190);
}

void customGUI(){
  Font font = new Font("Verdana", Font.BOLD,24);
  newLayerButton.setFont(font);
  widLab.setFont(font);
  posLab.setFont(font);
}

void makeActiveBox(Box b){
  ctrl.isControl = false;
  ctrl = b;
  widSlid.setValue(ctrl.wd);
  posSlid.setValue(ctrl.x);
  ctrl.isControl = true;
}

void mousePressed(){
  for(Box a : mboxes){
    if(a.isPressed(mouseX,mouseY)){
      makeActiveBox(a);
      break;
    }
  }
}