PGraphics unsichtbar; // Unsichtbare Zeichenfläche definieren

float xoff, yoff; // Strichstaerke
float schrittweite = 0.02;

float xoffB, yoffB; // Blau
float schrittweiteB = 0.3/10;

float xoffG, yoffG; // Gruen
float schrittweiteG = 0.4/10;

float xoffR, yoffR; // Rot
float schrittweiteR = 0.1/10;

void setup() {
  size(1200, 1200);
  PFont schrift = createFont("GT-Walsheim-Pro-Trial-Medium.otf", 800);
  unsichtbar = createGraphics(width, height, JAVA2D);
  unsichtbar.beginDraw();
  unsichtbar.textFont(schrift);
  unsichtbar.textSize(1200);
  unsichtbar.textAlign(CENTER, CENTER);
  unsichtbar.background(255);
  unsichtbar.fill(0);
  unsichtbar.text("e", unsichtbar.width/2, unsichtbar.height/2);
  unsichtbar.endDraw();
  noLoop();
}

void draw() {
  background(91, 50, 255);
  noFill();

  yoff = 0;
   yoffG = 0;
  yoffR = 0;
  yoffB = 0;
  for (int y = 0; y < height; y = y + 3) {
    yoff = yoff + schrittweite;
     yoffB = yoffB + schrittweiteB;
    yoffG = yoffG + schrittweiteG;
    yoffR = yoffR + schrittweiteR;
    xoff = 0;
    
    for (int x = 0; x < width; x = x + 3) {
      xoff = xoff + schrittweite;


      if (unsichtbar.get (x, y) == color(0)) {

        float strichstaerke = map(noise(xoff, yoff),0,1,0.1,10);
         float blau = map(noise(yoffB),0,1,0,255);
        float gruen = map(noise(yoffG),0,1,0,255);
        float rot = map(noise(yoffR),0,1,0,255);
        float blau2 = map(noise(yoffB),0,1,0,255);
        float gruen2 = map(noise(yoffG),0,1,0,255);
        float rot2 = map(noise(yoffR),0,1,0,255);
        strokeWeight(strichstaerke);
        stroke(rot, gruen, 255);
         float shiftX = map(noise(xoff, yoff),0,1,-50,50);
        float shiftY = map(noise(xoff, yoff),0,1,-100, 100);
       println(rot,gruen);
       
        ellipse (x + shiftX , y + shiftY , 1, 1);
         stroke(rot2, gruen2, 255);
        ellipse (x + shiftX -25, y + shiftY +25, 1, 1);
        ellipse (x + shiftX +25, y + shiftY -25, 1, 1);
        
      }   //NICHT DER BUCHSTABE
      if (unsichtbar.get (x, y) == color(255)) {
      
       
      
    
  }
    }}
  saveFrame ("data/kreis.tif");}
