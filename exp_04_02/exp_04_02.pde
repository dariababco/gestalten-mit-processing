PGraphics unsichtbar; // Unsichtbare Zeichenfläche definieren 
int abstand = 1; 
float xoff, yoff; // Strichstaerke
float schrittweite = 0.6/10;
float xoffB, yoffB; // Blau
float schrittweiteB = 0.1;

float xoffG, yoffG; // Gruen
float schrittweiteG = 0.5;

float xoffR, yoffR; // Rot
float schrittweiteR = 0.1;

void setup() {
  size(800, 800);
  PFont schrift = createFont("GT-Walsheim-Pro-Trial-Medium.otf", 800);
  unsichtbar = createGraphics(width, height, JAVA2D);
  unsichtbar.beginDraw();
  unsichtbar.textFont(schrift);
  unsichtbar.textAlign(CENTER, CENTER);
  unsichtbar.textSize(1100);
  unsichtbar.background(255);
  unsichtbar.fill(0);
  unsichtbar.text("e", unsichtbar.width/2, 250);
  unsichtbar.endDraw();
  noLoop();
}

void draw() {
  background(255);
  noFill();
  yoff= 0;
  for (int y = 0; y < 800; y = y + abstand) 
  { 
     yoff = yoff + schrittweite;
     xoff = 0;
    for (int x = 0; x < 800; x = x + abstand) 
    {   
      xoff = xoff + schrittweite;
      if ( y >= 0 && y <= 800) 
      {
        abstand = (y/1000)+1;
      }
      println(abstand);
      
      if (unsichtbar.get (x, y) == color(0)) 
      {
        float shiftX = map(noise(xoff, yoff),0,1,-20,20);
        float shiftY = map(noise(xoff, yoff),0,1,-50, 50);
      float blau = map(noise(yoffB),0,1,0,255);
        float gruen = map(noise(yoffG),0,1,0,255);
        float rot = map(noise(yoffR),0,1,0,255);
        float blau2 = map(noise(yoffB),0,1,0,255);
        float gruen2 = map(noise(yoffG),0,1,0,255);
        float rot2 = map(noise(yoffR),0,1,0,255);
        fill(rot,gruen,255);
        ellipse (x + shiftX, y + shiftY, 2, 2);
        //println(y);
      }  
      //NICHT DER BUCHSTABE
      if (unsichtbar.get (x, y) == color(255)) 
      {
       
      }     
    }

  }
  saveFrame ("data/kreis.tif");
}
