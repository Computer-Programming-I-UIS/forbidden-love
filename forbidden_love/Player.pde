class Player extends Actor {
  float dragX = 0.01;
  float valLimit = 10;
  float inputDelta = 0.5;
  
  float reloadDelay = 200;
  int latMilreload;
  
  float projectileSpread = 0.02;
  
  int animationSpeed = 250;
  
  int lastMilAni;
  int frameC;
  ArrayList<PImage> image;
  
  ArrayList<Projectie> projectiles;
  
  int tintDuration = 50;
  int lastMilTint;
  
  final int norm = 0;
  final int dead = 1;
  
  Player(int size_, String fileName_) {
    super(fileName_+"0000.png");
    lastMilAni = millis();
    frameC = 0;
    
   lastMilreload = millis();
   
   projectiles = new ArrayList<Projectiles>();
   
   images = new ArrayList<PImage>();
   for (int c= 0; c < size_; c++)
     images.add(loadImage(fileName+nf(c,4)+".png"));
   img = image.get(0);
   
   health = 100;
   
   cWidth = img.width;
   cHeight = img.height/2;
  }
     
   
  
  
