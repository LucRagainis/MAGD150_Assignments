size(600,600);
background(0);

//Galaxy
colorMode(HSB,360,100,100,100);
fill(250,80,30);
beginShape();
vertex(100,100);
vertex(50,300);
vertex(100,500);
vertex(300,550);
vertex(500,500);
vertex(550,300);
vertex(500,100);
vertex(300,50);
endShape(CLOSE);

//Sun
colorMode(RGB,255);
noStroke();
fill(255,255,0);
triangle(200,250,400,250,300,400);
triangle(200,350,400,350,300,200);
ellipse(300,300,150,150);

//Planets
fill(#6EF292);
arc(500,500,100,100,HALF_PI,TWO_PI,CHORD);
fill(#16C9BE);
arc(500,100,80,80,0,PI+HALF_PI,CHORD);
fill(#A54B2D);
arc(110,110,120,120,PI+HALF_PI,TWO_PI+PI,CHORD);
fill(#E82A89);
arc(100,500,100,100,PI,TWO_PI+HALF_PI,CHORD);
