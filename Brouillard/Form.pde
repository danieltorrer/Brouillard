/**
Form
The parent object of all objects inserted in the myst.
FTexture is the only one extending it in this example,
but a FShape class could easily be implemented along with 
some othe geometry based objects.
*/

abstract class Form {
  color col;
  PVector dim, pos, offs;
  float sca, rot;
  float alpha = 255;
  boolean isInView = true;
  
  Form(PVector pos, float sca, float rot, color col) {
    this.pos = pos;
    this.sca = sca;
    this.rot = rot; //we rotate objects (planes) only on the z axis
    this.col = col;
    offs = new PVector();
  }

  abstract void draw();
  
  void setPosition(PVector p){
    this.pos = p.get();
  }
  
  void setPosition(float x, float y, float z){
    this.pos = new PVector(x,y,z);
  }
  
  void setRotation(float rot){
    this.rot = rot;
  }
  
  void setScale(float sca){
    this.sca = sca;
  }
  
  void setColor(color col){
    this.col = col;
  }
  
  void setColor(float c){
    this.col = color(c, c, c);
  }
  
  void setColor(float r, float g, float b){
    this.col = color(r,g,b);
  }

  void setColor(float r, float g, float b, float a){
    this.col = color(r,g,b,a);
  }

  void checkDistance(Camera cam, Fog fog) {
    float z = cam.eye.z - pos.z;
    if (z <= fog.far && z > -1) {
      isInView = true;
    } 
    else {
      isInView = false;
    }
  }

  void fade(Camera cam, float near, float far) {
    float z = cam.getPosition().z - pos.z;
    z = constrain(z, near, far);
    alpha = map(z, near, far, 0, 255);
  }

  void showOrigin() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z); //vector based drawing in Processing?
    float l = 100; //axis length

    stroke(255, 0, 0);
    line(0, 0, 0, l, 0, 0);  

    stroke(0, 255, 0);
    line(0, 0, 0, 0, l, 0);     
    stroke(0, 0, 255);

    line(0, 0, 0, 0, 0, l);  
    popMatrix();
  }
}
