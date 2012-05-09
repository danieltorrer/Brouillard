/**
Brouillard / Mist
An image-scape in the mist.
Built in a workshop with advanced students at ECAL, Lausanne
and used with beginner students at ProcessingParis 2012, Paris
Works with Processing 1.5
A WebGL port is planned (maybe)

Use trackpad/mouse + keyboard for controls
Load different image-scapes with keys 1-5
For more controls see the keyPressed() functions

Coordinates are left "default",
which means right-hand axis with -z for depth.
This could be modified in a next version… 
*/

import processing.opengl.*;

ArrayList <Form> forms;
Camera cam;
MouseBlocker mb;
MultiKey mk;
Fog fog;

//Destination vector of the camera eye 
//left here for didactical reasons, could be integrated in the main Camera class
PVector cameraDest; 
boolean debug;

void setup() {
  size(screenWidth, screenHeight, OPENGL);
  frameRate(60);
  hint(ENABLE_DEPTH_SORT);
  hint(ENABLE_DEPTH_TEST);

  Media.preload(this);

  mb = new MouseBlocker(this);
  mk = new MultiKey(this);
  fog = new Fog(this, 100, 2000, color(255));
  cam = new Camera();

  buildForms(0);
}


void draw() {
  //background color with same color as fog.
  //interesting results are obtained also with different colors for bg and fog.
  background(fog.getColor());
  noCursor();

  //trackpad/mouse interaction
  //for absolute pointer values use mb.getAbsolute() and use in cam.setPosition();
  PVector pMouse = mb.getDelta();  

  //keyboard interaction use Q + A to rise / dive
  PVector pKeys = new PVector();
  if (mk.isDown(UP))        pKeys.z = -4;
  else if (mk.isDown(DOWN)) pKeys.z =  4;
  if (mk.isDown(RIGHT))     pKeys.x =  2;
  else if (mk.isDown(LEFT)) pKeys.x = -2;
  if (mk.isDown(81))        pKeys.y = -1; //Q
  else if (mk.isDown(65))   pKeys.y =  1; //A

  //add a little waving movement to the camera eye
  PVector pWave = new PVector(sin(frameCount*0.0029)*40, sin(frameCount*0.0023)*40, sin(frameCount*0.0019)*20);

  cameraDest.add(new PVector(pMouse.x, 0, pMouse.y)); //swapped coords
  cameraDest.add(pKeys);


  //world constraints
  cameraDest.x = constrain(cameraDest.x, -300, 300);
  cameraDest.y = constrain(cameraDest.y, -600, 100);
  cameraDest.z = constrain(cameraDest.z, -10000, 0);

  PVector pos = cam.getPosition();
  pos.x += (cameraDest.x - pos.x + pWave.x) * 0.08;  
  pos.y += (cameraDest.y - pos.y + pWave.y) * 0.08;  
  pos.z += (cameraDest.z - pos.z + pWave.z) * 0.08;
  cam.setPosition(pos);

  //draw
  cam.apply();
  if (debug) cam.print();
  for (Form f : forms) {
    f.checkDistance(cam, fog);
    f.fade(cam, 70, 120);
    f.draw();
    if (debug) f.showOrigin();
  }

  //save output, works best with non-interactive animation
  //saveOutput();
}

void keyPressed() {
  if (key == '1') buildForms(0);
  else if (key == '2') buildForms(1);
  else if (key == '3') buildForms(2);
  else if (key == '4') buildForms(3);
  else if (key == '5') buildForms(4);
  else if (key == 'd') debug = !debug;
  else if (key == 's') saveOutput(timestamp());
  
  //a little hack for debugging purposes:
  else if (key == '+') {
    fog.far += 100;
    fog.apply();
  }
  else if (key == '-') {
    fog.far = max(fog.far - 100, 0.1);
    fog.apply();
  }
}

void buildForms(int which) {
  forms = new ArrayList<Form>(); //reset list
  cameraDest = new PVector(); //reset camera
  cam.setPosition(cameraDest);

  if (which == 0) buildTrees();
  else if (which == 1) buildCave();
  else if (which == 2) buildClouds();
  else if (which == 3) buildPT();
  else if (which == 4) buildLetters();

  fog.apply(); //just for the color settings
}

