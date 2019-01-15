PGraphics unsichtbar; // Unsichtbare Zeichenfläche definieren 
int abstand = 1; 
float xoff, yoff; // Strichstaerke
float schrittweite = 0.6/10;
float xoffB, yoffB; // Blau
float schrittweiteB = 00.01;

float xoffG, yoffG; // Gruen
float schrittweiteG = 00.05;

float xoffR, yoffR; // Rot
float schrittweiteR = 0.01;

float shiftX = map(noise(xoff, yoff),0,1,-20,20);
     

void setup() {
  size(800, 800);
  PFont schrift = createFont("GT-Walsheim-Pro-Trial-Medium.otf", 800);
  unsichtbar = createGraphics(width, height, JAVA2D);
  unsichtbar.beginDraw();
  unsichtbar.textFont(schrift);
  unsichtbar.textAlign(CENTER, CENTER);
  unsichtbar.textSize(1100);
  unsichtbar.background(91, 50, 255);
  unsichtbar.fill(0);
  unsichtbar.text("e", unsichtbar.width/2, 250);
  unsichtbar.endDraw();
 noLoop();
}

void draw() {
background(#fcf3d9);
  
  yoff= 0;
    yoffG = 0;
  yoffR = 0;
  yoffB = 0;
  for (int y = 0; y < 800; y = y + abstand) 
  { 
     yoff = yoff + schrittweite;
     yoffB = yoffB + schrittweiteB;
    yoffG = yoffG + schrittweiteG;
    yoffR = yoffR + schrittweiteR;
     xoff = 0;
      xoffG = 0;
    xoffR = 0;
    xoffB = 0;
    for (int x = 0; x < 800; x = x + abstand) 
    {   
      xoff = xoff + schrittweite;
       xoffB = xoffB + schrittweiteB;
      xoffG = xoffG + schrittweiteG;
      xoffR = xoffR + schrittweiteR;
      if ( y >= 0 && y <= 800) 
      {
        abstand = (y/1000)+2;
      }
     
      
      if (unsichtbar.get (x, y) == color(0)) 
      {
        float shiftX = map(noise(xoff, yoff),0,1,-20,20);
        float shiftY = map(noise(xoff, yoff),0,1,-50, 50);
      float blau = map(noise(xoffB, yoffB),0,1,160,200);
        float gruen = map(noise(xoffG, yoffG),0,1,140,190);
        float rot = map(noise(xoffR, yoffR),0,1,30,100);
       fill(rot,gruen,255,70);
       
        noStroke();
        ellipse (x + shiftX, y + shiftY, 2, 2);
        fill(245,154,163,70);
        ellipse (x-shiftX , y-shiftY , 2, 2);
        
        println(rot,gruen,255);
      }  
      //NICHT DER BUCHSTABE
      if (unsichtbar.get (x, y) == color(255)) 
      { 
      }     
    }

  }
  saveFrame ("data/kreis.tif");
}
