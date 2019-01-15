
PGraphics unsichtbar; // Unsichtbare Zeichenfläche definieren 
int abstand = 1; 
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
  noFill();
  for (int y = 0; y < 800; y = y + abstand) 
  {     
    for (int x = 0; x < 800; x = x + abstand) 
    {   
      if ( y >= 0 && y <= 800) 
      {
        abstand = (y/20)+1;
      }
      println(abstand);

      if (unsichtbar.get (x, y) == color(0)) 
      {
        strokeWeight(1);
        stroke(0); 
        fill(255, 0, 0);
        line(x, y-10, x, y+10);
        line(x-10, y, x+10, y);
        line(x+5, y-5, x, y);
        line(x-5, y+5, x, y);
    

        //println(y);
      }  
      //NICHT DER BUCHSTABE
      if (unsichtbar.get (x, 800-y) == color(255)) 
      fill(255, 0, 0);
        line(x, 800-y-10, x, 800-y+10);
        line(x-10, 800-y, x+10, 800-y);
        line(x+5, 800-y-5, x, 800-y);
        line(x-5, 800-y+5, x, 800-y);
      {
      }
    }
  }
  saveFrame ("data/kreis.tif");
}
