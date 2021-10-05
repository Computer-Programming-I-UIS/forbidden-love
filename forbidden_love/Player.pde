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
   for (int c = 0; c < size_; c++)
     images.add(loadImage(fileName+nf(c,4)+".png"));
   img = image.get(0);
   
   maxHealth = 100;
   actualhealth = maxHealth;
   
   cWidth = img.width;
   cHeight = img.height/2;
 }
  
  
  Player(float x_, float y_, int size_, String fileName_){
    super(x_, y_,fileName_+"0000.png");
    lastMilAni = millis();
    frameC = 0;
    
    projectiles =new ArrayList<Projectile>();
    
     images = new ArrayList<PImage>();
   for (int c = 0; c < size_; c++)
     images.add(loadImage(fileName+nf(c,4)+".png"));
   img = image.get(0);
   
   heatlth = 100;
   cWidth = img.width;
   cHeight = img.height/2;
 }
 
 @Override
 void update(){
   if (state == norm && health <=0
     state = dead;
   } else if(state == dead && loc.y < camera.loc.y+height/2){
     movementeControl(new PVector());
   } else if (state == norm){
     inputCalculations();
     
     checkWalls();
     
     animationController();
     
     projectileController();
 }
 
 void projectileController(){
   
   if(zHold && millis() - lastMilreload > reloadDelay){
     PVector v = new PVector(30,0);
     v.rotate(random(-PI*projectileSpread, PI*projectileSpread));
     projectiles.add(new Projectiles(loc.x,loc.y,v.x,v.y,1,randomTextureProjectile()));
     lastMilreload = millis();
     scores.shot++;
   }
   
   for (int c = 0; c < projectiles.size(), c++){
     Projectile p = projectiles.get(c);
     
     //Si esta fuera de pantalla el proyectill
     if (p.dead){
       projectiles.remove(p);
       continue;
     }
     
     
 
   
  
  
