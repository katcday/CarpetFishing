// draws the endscreen
void endscreen() {
  // sets the color back to our wall color
  background(office);
  
  // we need to draw a rectangle with the color of the ocean
  fill(ocean);
  rect(oceanx, oceany, 800, 600);
  // by changing hte y position everytime we can animate the ocean going down
  oceany += 3;
  
  // easier to draw the fisher with corner coords
  imageMode(CORNER);
  // draw fisher with incremented x and y coords
  image(fisher, fisherx, fishery);
  
  // change test size
  textSize(48);
  
  // this animates all images and text on screen
  if (fishery < 150) {
    fishery += 3;
    titley += 2;
    liney = fishery - (150 - 282);
  }
  
  // if our fish is dead we don't draw the marlin
  if (dead == true) {
    textSize(40);
    // draw losing elements
    text("You lost your fish :(", 280, titley);
    // no fish on line so it just follows the mouse
    line(422, liney, mouseX, mouseY);
  }
  else {
    // if not dead we animate the fisher catching mr marlin
    text("Nice.", 130, titley);
    line(422, liney, mrMarlin.x, mrMarlin.y - marlin.height/2 + 62);
    
    // easier to draw in center
    imageMode(CENTER);
    // mr marlin stops moving when he's close to the end position
    if (mrMarlin.x < marlin.width/2 + 5) {
      mrMarlin.x += 3;
    }
    else if (mrMarlin.x > marlin.width/2 + 10) {
      mrMarlin.x -= 3;
    }
    
    if (mrMarlin.y < 500) {
      mrMarlin.y += 3;
    }
    
    image(marlin, mrMarlin.x, mrMarlin.y);
  }
  
  // if the player clicks enter it will replay 
  // all we do is reset the fish and all start variables
  if (start == true) {
    imageMode(CORNER);
    mainscreen = true;
    game = false;
    endscreen = false;
    start = false;
    // position variables for fisher image
    fisherx = 350;
    fishery = 150;
    // positions for title text
    titlex = 260;
    titley = 150;
    // colors for mainscreen
    text = color(135, 130, 131);
    ocean = color(131, 167, 230);
    office = color(209, 240, 223);
    
    // game screen variables
    dead = false;
    // time variable holds how many times the loop has played through
    time = 1;
    // amount of times to pass before more fish are generated
    modfood = 100;
    modpred = 100;
    // this is the speed of the fish
    foodSpeed = -1;
    predSpeed = 1;
    // this holds the player's points
    points = 0;
    // determines if marlin is in the game
    marlinTime = false;
    // marlin
    //Fish mrMarlin = new Fish(800 + 564/2, 300, -1, 0);
    
    // endscreen variables
    oceanx = 0;
    oceany = 0;
    liney = fishery - (150 - 282);
    
    // our image variables

    predR = pred;
    predH = 40;
    mainR = main;
    mainH = 30;
    
    foodR = food;
    foodH = 20;

    
    // holds our fishies
    for (int z = 0; z < 60; z++) {
      // we are going to reset our fish
      preds[z].predSet();
      foods[z].foodSet();
    }
  }
}
