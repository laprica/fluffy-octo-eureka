import g4p_controls.*;
import java.util.ArrayList;
import java.awt.Font;

boolean baseShow = false;
PFont f;
Box base;
Box mask;
Box ctrl;
ArrayList<Box> boxes;
boolean mouseDown;

void setup(){
  size(1280,720);
  //printArray(PFont.list());
  f = createFont("Verdana",24);
  textFont(f);
  textAlign(CENTER,CENTER);
  base = new Box(120,500,420,100,200,279);
  mask = new Box(170,100,10,100,color(20,30,90),279);
  ctrl = mask;
  boxes = new ArrayList<Box>();
  boxes.add(base);
  boxes.add(mask);
  createGUI();
  customGUI();
}

void draw(){
  color c = color(100,255/4,255/8);
  background(c);
  drawCanvas();
  //update(mouseX,mouseY);
  //base.display();
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

void makeNewBox(){
  Box x = new Box(190,100,10,100,color(random(225),random(225),random(225)),279);
  ctrl = x;
  boxes.add(ctrl);
  widSlid.setValue(100);
  posSlid.setValue(190);
}

void customGUI(){
  Font font = new Font("Verdana", Font.BOLD,24);
  newLayerButton.setFont(font);
  widLab.setFont(font);
  posLab.setFont(font);
}