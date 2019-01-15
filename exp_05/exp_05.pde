PGraphics unsichtbar; // Unsichtbare Zeichenfläche definieren 
float abstand = 1; 
float xoff, yoff;
float schrittweite = 0.8;
 float floaty;
 int animation = 1;
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
  
}

void draw() {
  background(255);
  animation = animation + 1;
        if (animation == 110) {
          animation = 90;}
          println(animation);
  yoff = 0;
  for (float y = 0; y < 800; y = y + abstand) 
  {     
    yoff = yoff + schrittweite;
    xoff = 0;
    for (float x = 0; x < 800; x = x + abstand) 
    {   
      xoff = xoff + schrittweite;
      if ( y >= 0 && y <= 800) 
      {
        floaty = map(noise(xoff,yoff),0,1,1,10);
  //println("noise: " + y);
   
        abstand = (y/animation)+1;
        
      }
     // println(abstand);
      
      if (unsichtbar.get (int(x), int(y)) == color(0)) 
      {
        
        fill(0);
        rect (x +floaty , y + floaty, 1, 1);
        //println(y);
      }  
      //NICHT DER BUCHSTABE
      if (unsichtbar.get (int(x), int(800-y)) == color(255)) 
      {
        ellipse (x +floaty , (800-y) + floaty, 1, 1);
      }     
    }

  }
  if (frameCount >= 1 && frameCount < 110) {
   saveFrame("line-######.tif");}
}
