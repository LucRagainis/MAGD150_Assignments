//some code adapted from the bouncingball_vectors example.

PVector position;
PVector velocity;
PVector flower;
PVector windy;
float[] speedmult = {1,1.5,2,2.5,3,3.5};
int x;

void setup(){
  size (1000,600);
  position = new PVector(100, 100);
  velocity = new PVector(5,2.5);
  flower = new PVector(700,200);
  windy = new PVector(20,0);
  x = 0;
  println("Click the mouse to speed up the Bee. If you go too fast, he'll reset.");
  println("Press the space bar to blow the Bee in the wind.");
}

void draw(){
  background(#5EE3E2);
  noStroke();
  fill(#07AA05);
  rect(0,400,1000,600);
  stroke(0,100,0);
  strokeWeight(15);
  line(flower.x,flower.y+5,flower.x, flower.y+300);

  //PVector funtion to create the movement of the Bee.
  position.add(velocity);

  //Booleans to keep the Bee on the screen if it reaches a side.
  //Also keeps the Bee in the sky if it's close to the ground.
  if ((position.x > width) || (position.x < 0)) {
    velocity.x = velocity.x * -1;
  }  
  if ((position.y > 350) || (position.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  
  //The Flower.
  pushMatrix();
  //Moves the origin to the center of the flower.
  translate(flower.x,flower.y);
  //Has the flower tilt in the wind.
  rotate(position.x / 1000.0 + 0.4);
  //The flower gets slightly bigger as it's blown towards the screen,
  //Then settles back away from the screen.
  scale(position.x/10000+1);
  stroke(0);
  strokeWeight(5);
  fill(#E81589);
  arc(0,0,150,150,PI+HALF_PI,TWO_PI+PI,PIE);
  popMatrix();
  
  //The Bee.
  stroke(0);
  strokeWeight(10);
  fill(255,255,0);
  ellipse(position.x,position.y,50,50);
}

//speeds up the Bee and the wind.
void mousePressed(){
  velocity.mult(speedmult[x]);
  if ( x == 5 ){
    x = 0;
    position = new PVector(100, 100);
    velocity = new PVector(5,2.5);
    println("That was a little too fast. He's reset himself.");
  }else{
    x = x + 1;
  }
}

//makes the Bee jump to the left a little bit.
void keyPressed(){
  if (position.x>10){
  position.sub(windy);
  }
}
