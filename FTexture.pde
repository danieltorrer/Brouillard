/**
FTexture <- Form
A plane in our 3D world.
Can be a static image or an animated sequence.
Images can be colored with tint (use a white image as a base for a flat tint).
*/

class FTexture extends Form {
  PImage[] tex;
  private int frameOffset = 0; //for animated sprites
  private int frameSpeed = 1; //frame playback speed
  boolean flip = false; //images can be flipped
  
  FTexture(PImage[] tex, PVector pos, float sca, float rot, color col ) {
    super(pos, sca, rot, col);
    this.tex = tex;
    setAlign(CENTER, CENTER);
  }
  
  FTexture(PImage tex, PVector pos, float sca, float rot, color col ) {
    super(pos, sca, rot, col);
    this.tex = new PImage[1];
    this.tex[0] = tex;
    setAlign(CENTER, CENTER);
  }

  FTexture(PImage tex) {
    this(tex, new PVector(), 1, 0, color(255));
  }

  FTexture(PImage tex, PVector pos) {
    this(tex, pos, 1, 0, color(255));
  } 

  void flip(){ 
    this.flip = !this.flip;
  }
  
  void setFrameSpeed(int s) {
    frameSpeed = max(s, 0);
  }

  void setFrameOffset(int o) {
    frameOffset = o;
  }

  void setAlign(int ax, int ay) {
    //alignement basé sur la taille du premier frame
    PImage t = tex[0];
    int w = t.width/2;
    int h = t.height/2;

    if (ax == CENTER) offs.x = 0;
    else if (ax == LEFT) offs.x =  w;
    else if (ax == RIGHT) offs.x = -w;    

    if (ay == CENTER) offs.y = 0;
    else if (ay == TOP) offs.y = h;
    else if (ay == BOTTOM) offs.y = -h;
  }

  void draw() {
    if (isInView) { //we check if the object is visible
      int current = 0;
      if (frameSpeed > 0) current = (frameCount / frameSpeed + frameOffset) % tex.length;
      PImage t = tex[current];

      pushMatrix();
      translate(pos.x, pos.y, pos.z);
      scale(sca);
      translate(offs.x, offs.y, offs.z); //the offset has applyed after the scale
      rotateZ(rot);
      int w = t.width/2;
      int h = t.height/2;

      if (flip) w = -w;
      beginShape();
      noStroke();
      textureMode(NORMALIZED);
      texture(t);
      tint(col, alpha);
      vertex(-w, -h, 0, 0);
      vertex( w, -h, 1, 0);
      vertex( w, h, 1, 1);
      vertex(-w, h, 0, 1);
      endShape();

      noTint();
      popMatrix();
    }
  }
}
