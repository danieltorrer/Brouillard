/**
Media
Has the purpose to preload media and manage it
a bit a waste for all the combined examples here…
*/
final static class Media {
  
  static PImage k, r, s, dot;
  static PImage grotte;
  static PImage[] trees, clouds, numbers, ptTeddy, ptShifty;

  static void preload(PApplet p) {
    //lettres
    dot = p.loadImage("lettres/dot.png");  
    k = p.loadImage("lettres/k.png");
    r = p.loadImage("lettres/r.png");
    s = p.loadImage("lettres/s.png");  

    //trees  
    trees = new PImage[6];
    for (int i=0; i<trees.length; i++) {
      trees[i] = p.loadImage("trees/albero_" + i + ".png");
    }
    
    //numeros  
    numbers = new PImage[6];
    for (int i=0; i<numbers.length; i++) {
      numbers[i] = p.loadImage("numbers/nr_" + (i + 1) + ".png");
    }

    //clouds  
    clouds = new PImage[3];
    for (int i=0; i<clouds.length; i++) {
      clouds[i] = p.loadImage("nuages/n_" + i + ".png");
    }
    
    //grotte
    grotte = p.loadImage("grotte/bedeilhacpostcard.png");
    
    //Teddy and Shifty 
    //from Processing example AnimatedSprite
    //by James Paterson / Presstube
    ptTeddy = new PImage[60];
    for (int i=0; i<ptTeddy.length; i++) {
      ptTeddy[i] = p.loadImage("pt_teddy/PT_Teddy_" + nf(i, 4) + ".gif");
    }

    ptShifty = new PImage[38];
    for (int i=0; i<ptShifty.length; i++) {
      ptShifty[i] = p.loadImage("pt_shifty/PT_Shifty_" + nf(i, 4) + ".gif");
    }
  }
}
