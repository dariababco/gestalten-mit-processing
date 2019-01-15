PGraphics unsichtbar; // Unsichtbare Zeichenfläche definieren 
int abstand = 1; 
float xoff, yoff;
float schrittweite = 0.8;
 float floaty;
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
  unsichtbar.text("e", unsichtbar.width/2, unsichtbar.height/4);
  unsichtbar.endDraw();
  noLoop();
}

void draw() {
  background(255);

  yoff = 0;
  for (int y = 0; y < 800; y = y + abstand) 
  {     
    yoff = yoff + schrittweite;
    xoff = 0;
    for (int x = 0; x < 800; x = x + abstand) 
    {   
      xoff = xoff + schrittweite;
      if ( y >= 0 && y <= 800) 
      {
        floaty = map(noise(xoff,yoff),0,1,1,10);
  println("noise: " + y);
 
        abstand = (y/100)+1;
      }
      println(abstand);
      
      if (unsichtbar.get (x, y) == color(0)) 
      {
        
        fill(0);
        ellipse (x +floaty , y + floaty, 3, 3);
        //println(y);
      }  
      //NICHT DER BUCHSTABE
      if (unsichtbar.get (x, 800-y) == color(255)) 
      {
        ellipse (x +floaty , (800-y) + floaty, 3, 3);
      }     
    }

  }
   saveFrame ("data/kreis.tif");
}
