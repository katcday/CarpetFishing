//TITLE: Carpetfishing
//AUTHOR: K. Camille Day
//DATE DUE: 2/8/22
//DATE SUBMITTED: 2/8/22
//COURSE TITLE: CSC202-H
//MEETING TIME(S): TTh 10:30-12:00
//DESCRIPTION: A man sitting at his desk decides to pretend the carpet is his ocean, with the ultimate goal of catching the elusive Mr. Marlin.

// these run different parts of the draw function
// if mainscreen is true than mainscreen gets called etc.
boolean mainscreen = true;
boolean game = false;
boolean endscreen = false;
// controls if start screen starts 
boolean start = false;
// position variables for fisher image
int fisherx = 350;
int fishery = 150;
// positions for title text
int titlex = 260;
int titley = 150;
// colors for mainscreen
color text = color(135, 130, 131);
color ocean = color(131, 167, 230);
color office = color(209, 240, 223);
// determines whether to display rules or not
boolean rules = false;

// game screen variables
boolean dead = false;
// time variable holds how many times the loop has played through
int time = 1;
// amount of times to pass before more fish are generated
int modfood = 100;
int modpred = 100;
// this is the speed of the fish
int foodSpeed = -1;
int predSpeed = 1;
// this holds the player's points
int points = 0;
// determines if marlin is in the game
boolean marlinTime = false;
// marlin
Fish mrMarlin = new Fish(800 + 564/2, 300, -1, 0);

// endscreen variables
int oceanx = 0;
int oceany = 0;
int liney = fishery - (150 - 282);

// our image variables
PImage fisher;
PImage pred;
PImage predR;
int predH = 40;
PImage main;
PImage mainR;
int mainH = 30;
PImage food;
PImage foodR;
int foodH = 20;
PImage marlin;

//font 
PFont font;

// holds our fishies
Fish[] foods = new Fish[60];
Fish[] preds = new Fish[60];

void setup() {
  // make the screen
  size(800, 600);
  
  noStroke();
  
  // load in all images
  imageMode(CORNER);
  fisher = loadImage("fishersmall.png");
  pred = loadImage("predc.png");
  main = loadImage("mainc.png");
  food = loadImage("foodc.png");
  marlin = loadImage("marlin2.png");
  
  // we will go ahead and resize to their initial heights
  predR = pred;
  predR.resize(0, predH);
  mainR = main;
  mainR.resize(0, mainH);
  foodR = food;
  foodR.resize(0, foodH);
  
  // load fonts
  font = loadFont("font.vlw");
  textFont(font);
  
  // we need to fill up our fish arrays so we can use them in the game
  for (int prey = 0; prey < 60; prey++) {
    foods[prey] = new Fish(800, 0, -1, 0);
  }
  
  // next we make our predators
  for (int p = 0; p < 60; p++) {
    preds[p] = new Fish(0, 0, 1, 0);
  }
  
}

void draw() {
  // determines which part of the game to draw
  if (mainscreen == true) {
    mainscreen();
  }
  if (game == true) {
    game();
  }
  if (endscreen == true) {
    endscreen();
  }
}
