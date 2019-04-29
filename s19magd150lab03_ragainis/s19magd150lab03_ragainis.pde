float i = 15.0;

void setup(){
  size(1000,600);
  background(#17E3FC);
  rectMode(CORNERS);
  fill(255,100);
  println("Move the mouse to make bubbles, click to change bubble size and color, press space to reset.");
}
void draw(){
  pushStyle();
  noStroke();
  fill(255,10);
  rect(mouseX + i/2,mouseY,mouseX - i/2,height);
  popStyle();
  ellipse(mouseX,mouseY,i,i);
  ellipse(lerp(pmouseX,mouseX,1),lerp(pmouseY,mouseY,1),i,i);
}
void mousePressed(){
  fill(0,millis()%156 + 100,millis()%56 + 200,150);
  i = millis()%45.5 + 4.5;
  println("Bubble Size: " + i);
  println("Bubble Height: " + round(dist(mouseX,mouseY,mouseX,height)));
}
void keyPressed(){
  fill(255,100);
  background(#17E3FC);
  println("Frame Count: " + frameCount);
  i = 15.0;
}
