//Adhere to the theme Movie Posters
//Create or load and display at least 2 fonts.
//Change the alignment of text on the screen.
//Either animate the text or make it react to user input.
//Load strings from an external file.
//Enable users to save the composition as a .pdf file.
//Ensure that the code contains at least 4 single- or multi-line comments, 
//written in complete sentences, that explain what the code is doing at key steps.

import processing.pdf.*;
String[] adj;
String[] noun;
String fileName;
Boolean screenShot;
PFont font1;
PFont font2;
int x,y;

void setup(){
  size(400,500);
  fileName = "poster";
  screenShot = false;
  adj = loadStrings("title_adj.txt");
  noun = loadStrings("title_noun.txt");
  font1 = createFont("Impact",65);
  font2 = createFont("Arial",40);
  x = 0;
  y = 0;
  println("Click the mouse to change the title. Press space to save as a PDF");
}

void draw(){

//Saves to PDF if the screenShot boolean is true.
  if (screenShot == true){
    beginRecord(PDF,fileName+".pdf");
  }

  background(#007581);
  noStroke();
  fill(#E57300);
  rect(0,0,width,130);
  fill(255);
  textAlign(LEFT);
  textSize(65);
  textFont(font1);
  text("The",20,100);
  textAlign(RIGHT);
//The title is generated at random from the two text lists,
//using one adjective and one noun.
  text(adj[x],380,200);
  text(noun[y],380,280);
  textAlign(CENTER);
  textSize(40);
  textFont(font2);
  text("Coming Soon...",width/2,height-20);

//Ends the PDF save and toggles the screenShot boolean.
  if (screenShot == true){
    endRecord();
    screenShot = false;
  }
}

//When the mouse is pressed, the title is regenerated
//giving a new random title.
void mousePressed(){
  x = (int)random(adj.length);
  y = (int)random(noun.length);
}

//When a key is pressed, the poster with its random title
//is saved as a PDF file by toggling the screenShot boolean.
void keyPressed() {
  screenShot = true;
}
