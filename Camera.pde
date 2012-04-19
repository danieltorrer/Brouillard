/**
Camera
Wraps the Processing camera function
Camera basically moves around XYZ axis, looks only forward (-z) and never rotates
Multiple camera can be set up
A good place to implement some movement functions and interpolations
*/

class Camera {
  PVector eye, lookAt, up;
  private float fov = PI/3;
  float cameraZ;
  float near = 0.001;
  float far = 1000;

  Camera(PVector eye, PVector lookAt, float fov) {
    this.eye = eye;
    this.lookAt = lookAt;
    this.up = new PVector(0,1,0);
    setFov(fov);
  }
  
  Camera(){
    this(new PVector(), new PVector(0, 0, -1), PI/3);
  }
  
  void print(){
    println("-- CAMERA ---------------");
    println("eye: ");
    println("x = " + eye.x);
    println("y = " + eye.y);
    println("z = " + eye.z);    
    println("");
    println("lookAt: ");
    println("x = " + lookAt.x);
    println("y = " + lookAt.y);
    println("z = " + lookAt.z);    
  }

  void setFov(float fov) {
    this.fov = fov;
    cameraZ = (height/2.0) / tan(fov/2.0);
  }
  
  void setPosition(float x, float y, float z){
    setPosition(new PVector(x,y,z));
  }
  
  void setDest(){
  }
  
  void setPosition(PVector p){
    PVector d = PVector.sub(lookAt, eye);
    eye = p.get();
    lookAt = p.get();
    lookAt.add(d);
  }
  
  PVector getPosition(){
    return eye.get();
  }
  
  void translate(PVector t) {
    eye.add(t);
    lookAt.add(t);
  }

  void translate(float x, float y, float z) {
    translate(new PVector(x, y, z));
  }

  void apply() {
    perspective(fov, float(width)/float(height), cameraZ*near, cameraZ*far);
    camera(eye.x, eye.y, eye.z, lookAt.x, lookAt.y, lookAt.z, 0, 1, 0);
  }

  void draw() { //debug
    g.sphereDetail(10);

    //eye
    g.pushMatrix();
    g.translate(eye.x, eye.y, eye.z);
    g.noStroke();
    g.fill(0);
    g.sphere(10);
    g.popMatrix();

    //lookAt
    g.pushMatrix();
    g.translate(lookAt.x, lookAt.y, lookAt.z);
    g.noStroke();
    g.fill(0);
    g.sphere(5);
    g.popMatrix();
    
    g.stroke(0);
    g.line(eye.x, eye.y, eye.z, lookAt.x, lookAt.y, lookAt.z);
  }
}
