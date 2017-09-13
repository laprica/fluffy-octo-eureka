import java.util.ArrayList;

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
}

void draw(){
  color c = color(100,255/4,255/8);
  background(c);
  drawCanvas();
  drawButton(120);
  drawNewButton(240);
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

void drawButton(color x){
  stroke(215);
  fill(x);
  rect(700,200,100,50);
  fill(color(20,30,59));
  text("base",700+(100/2),200+(50/2));
}

void drawNewButton(color x){
  stroke(279);
  fill(x);
  rect(700,300,100,50);
  fill(color(20,30,59));
  text("newLayer",700+(100/2),300+(50/2));
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
  // check if base is drawn
  if(x < 700+100 && x > 700 && y > 200 && y <200+50){
    drawButton(color(210));
    if(mousePressed){
      base.show = true;
      drawButton(color(89,20,100));
    }
  }
  // check if new layer is clicked
  if(x < 700+100 && x > 700 && y >300 && y < 300+50){
    drawNewButton(color(30,200,100));
    if(mousePressed){
      drawNewButton(color(90,200,100));
    }
  }
}

void mouseClicked(){
  if(mouseX < 800 && mouseX > 700 && mouseY>300 &&mouseY<350){
    makeNewLayer();
  }
}