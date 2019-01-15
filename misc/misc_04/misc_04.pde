
PGraphics unsichtbar; // Unsichtbare Zeichenfläche definieren 
int abstand = 1; 
float rand = random(10,25);
float xoff = 1;
float yoff = 1;
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
  background(#929aab);
  noFill();
   for (int i=0; i<10; i++) {
     yoff=1;
  for (int y = 0; y < 800; y = y + abstand) 
  {     
    yoff = yoff + 1;
    xoff = 1;
    for (int x = 0; x < 800; x = x + abstand) 
    {   
      xoff = xoff + 1;
      if ( y >= 0 && y <= 800) 
      {
        
        int noiseA = 1;
        noiseA= int(map(noise(xoff,yoff),0,1,20,30));
        abstand = (y/noiseA)+1;
      }
      println(abstand);

      if (unsichtbar.get (x, y) == color(0)) 
      {
        
        strokeWeight(1);
       
       stroke(247, 247, 247,30); 
       curve(x+rand, y-rand, x+rand-5, y-rand,x, y+i, x+6,y+i );
        curve(x-rand, y+rand, x+rand+5, y+rand,x, y-i, x-6,y-i );
        }

        //println(y);
        
      //NICHT DER BUCHSTABE
      if (unsichtbar.get (x, 800-y) == color(255)) {
       stroke(#ffffff); 
       // line(x, 800-y-10, x, 800-y+10);
       // line(x-10, 800-y, x+10, 800-y);
        stroke(247, 247, 247,30); 
        curve(x+rand, 800-y-rand, x+rand-5, 800-y-rand,x, 800-y+i, x+6,800-y+i );
        curve(x-rand, 800-y+rand, x+rand+5, 800-y+rand,x, 800-y-i, x-6,800-y-i );
        
        
      
      }
    }
  }
  saveFrame ("data/kreis.tif");
}}
