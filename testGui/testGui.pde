import g4p_controls.*;
import java.util.ArrayList;
import java.awt.Font;

boolean baseShow = false;
PFont f;
Box base;
ArrayList<Box> boxes;
boolean mouseDown;

void setup(){
  size(1280,720);
  //printArray(PFont.list());
  f = createFont("Verdana",24);
  textFont(f);
  textAlign(CENTER,CENTER);
  base = new Box(120,500,420,100,200,279);
  boxes = new ArrayList<Box>();
  boxes.add(base);
  createGUI();
  customGUI();
}

void draw(){
  color c = color(100,255/4,255/8);
  background(c);
  drawCanvas();
  update(mouseX,mouseY);
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

void makeNewLayer(){
  println("yay new layer");
  int thickness = round(random(10,50));
  Box top = boxes.get(boxes.size()-1);
  int newWd = top.wd;
  int newX = top.x;
  int newY = top.y - thickness;
  color c = color(random(255),random(255),random(255));
  color s = color(random(255),random(255),random(255));
  Box newBox = new Box(newX, newY, newWd, thickness,c,s);
  boxes.add(newBox);
}

void update(int x, int y){
  
}

void mouseClicked(){
  if(mouseX < 800 && mouseX > 700 && mouseY>300 &&mouseY<350){
    makeNewLayer();
  }
}

void customGUI(){
  Font font = new Font("Verdana", Font.BOLD,24);
  newLayerButton.setFont(font);
}