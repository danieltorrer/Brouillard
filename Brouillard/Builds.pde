/**
A set of functions to build some very basic landscape
*/

void buildTrees() {
  fog.setColor(color(255));
  for (int i=0; i<400; i++) {
    int ind = (int) random(0, Media.trees.length);
    FTexture f = new FTexture(Media.trees[ind]);
    f.setPosition(random(-1500, 1500), 200, random(-20000, 0));
    f.setColor(0);
    f.setScale(random(0.7, 1.3));
    f.setAlign(CENTER, BOTTOM); //it's possible to choose an anchor point for the textures
    forms.add(f);
  }
}

void buildCave() {
  fog.setColor(color(0));  
  for (int i=0; i<800; i++) {
    FTexture f = new FTexture(Media.grotte);
    f.setPosition(random(-130, 130), random(-50, 50) -70, -i*80);
    f.setRotation(random(-0.3, 0.3));
    f.setScale(random(0.9, 1.1));
    if (random(0, 1) < 0.5) {
      f.flip = true;
    }
    forms.add(f);
  }
}

void buildClouds() {
  fog.setColor(color(30, 130, 255));    
  for (int i=0; i<350; i++) {    
    int ind = (int) random(0, Media.clouds.length);
    FTexture f = new FTexture(Media.clouds[ind]);
    f.setPosition(random(-1500, 1500), random(-50, 350), random(-14000, 4000));
    f.setRotation(random(-0.3, 0.3));
    f.setScale(random(0.6, 1.4));
    //n.setColor(random(255),random(255),random(255)); //psychedelia!
    if (random(0, 1) < 0.5) {
      f.flip();
    }
    forms.add(f);
  }
}

void buildPT() {
  fog.setColor(color(255));      

  forms.add(new FTexture(Media.dot, new PVector(0, 0, -300), 0.1, 0, color(255, 70, 50)));
  forms.add(new FTexture(Media.dot, new PVector(0, 0, -1300), 0.1, 0, color(255, 70, 50)));
  forms.add(new FTexture(Media.dot, new PVector(0, 0, -2300), 0.1, 0, color(255, 70, 50)));

  for (int i=0; i<Media.ptTeddy.length; i++) {
    PVector  p = new PVector(200, 0, -200 - i*10);
    FTexture f = new FTexture(Media.ptTeddy[i], p, 1, 0, color(255));
    forms.add(f);
  }

  for (int i=0; i<Media.ptShifty.length; i++) {
    PVector  p = new PVector(-200, 0, -400 - i*10);
    FTexture f = new FTexture(Media.ptShifty[i], p, 1, 0, color(255));
    forms.add(f);
  }

  for (int i=0; i<Media.ptTeddy.length; i++) {
    PVector  p = new PVector(200, 0, -1400 - i*10);
    FTexture f = new FTexture(Media.ptTeddy, p, 1, 0, color(255));
    f.setFrameOffset(i);
    f.setFrameSpeed(2);    
    forms.add(f);
  }

  for (int i=0; i<Media.ptShifty.length; i++) {
    PVector  p = new PVector(-200, 0, -1400 - i*10);
    FTexture f = new FTexture(Media.ptShifty, p, 1, 0, color(255));
    f.setFrameOffset(i);
    f.setFrameSpeed(3);    
    forms.add(f);
  }

  float ox = Media.ptTeddy.length * 80 / 2;
  for (int i=0; i<Media.ptTeddy.length; i++) {
    PVector  p = new PVector(i * 80 - ox, 0, -2400);
    FTexture f = new FTexture(Media.ptTeddy, p, 1, 0, color(255));
    f.setFrameOffset(i);
    f.setFrameSpeed(3);    
    forms.add(f);
  }
}

void buildLetters() {
  for (int i=0; i<10; i++) {
    PVector  p = new PVector(random(-200, 200), 200, - i * 400 - 1000);
    float    s = random(0.3, 1.5);
    color    c = color(random(40), random(130,170), random(230,255));
    FTexture f = new FTexture(Media.k, p, s, 0, c);
    f.setAlign(CENTER, BOTTOM); 
    forms.add(f);
  }

  for (int i=0; i<10; i++) {
    PVector  p = new PVector(random(-200, 200), 200, - i * 400 - 4000);
    float    s = random(0.3, 1.5);
    color    c = color(random(240,255), random(180,220), random(20));
    FTexture f = new FTexture(Media.r, p, s, 0, c);
    f.setAlign(CENTER, BOTTOM); 
    forms.add(f);
  }

  for (int i=0; i<10; i++) {
    PVector  p = new PVector(random(-200, 200), random(-200, 200), - i * 400 - 7000);
    float    s = random(0.3, 1.5);
    float    r = random(-0.3, 0.3);
    color    c = color(random(70,90), random(230,255), random(10));
    FTexture f = new FTexture(Media.s, p, s, r, c);
    f.setAlign(CENTER, BOTTOM); 
    forms.add(f);
  }

  for (int i=0; i<150; i++) {
    PVector p = new PVector(random(-400, 400), random(-100, 100), -i * 100 - 450);
    float   s = 0.25;
    float   r = 0;
    Form    f = new FTexture(Media.dot, p, s, r, color(random(200,255), random(50), random(10)));
    forms.add(f);
  }

  for (int i=0; i<150; i++) {
    PVector  p = new PVector(random(-400, 400), random(-200, 200), -i * 100 - 540);
    float    s = random(0.4, 0.8);
    float    r = random(-0.4, 0.4);
    FTexture f = new FTexture(Media.numbers, p, s, r, color(random(180,220), random(70,90), random(180,230)));
    f.setFrameSpeed(floor(random(3, 100)));
    f.setFrameOffset(floor(random(Media.numbers.length)));

    forms.add(f);
  }
}

