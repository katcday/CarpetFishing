void mainscreen() {
  // draws wall color for office screen
  background(office);
  stroke(150);
  strokeWeight(1);
  
  // if start is false we don't animate the screen
  if (start == false) {
    
    image(fisher, fisherx, fishery);
    
    // title and press enter to start
    textAlign(CENTER);
    fill(135, 130, 131);
    textSize(48);
    text("Carpetfishing.", titlex, titley);
    textSize(20);
    text("Press enter to start!", 250, 200);
    text("Press r to read rules", 130, 595);
    
    line(423, 282, 423, 600);
    
    // if the player toggles rules, they show up here
    if (rules == true) {
      textAlign(LEFT);
      text("You are the tastiest little\npiece of bait with one goal:\nLure Mr. Marlin in by eating\nas many little fishies as you \ncan and not getting eaten by\nthe big red fishies. When\nMr. Marlin believes you are\ntasty enough, he will come\nand eat you!", 35, 300);
      
    }
    textAlign(CENTER);
  }
  
  
  // when enter is pressed we animate the screen up to our ocean screen
  if (start == true) {
    // if we don't reset it, and the player starts the game over, the rules will still be displayed
    rules = false;
    
    
    if (fishery > -450) {
      fill(text);
      image(fisher, fisherx, fishery);
      fishery -= 3;
      
      // title screen too
      textSize(48);
      text("Carpetfishing.", titlex, titley);
      titley -= 2;
      
      // we want the ocean to come up
      fill(ocean);
      rect(0, fishery + 450, 800, 600);
      
      // draw our fishing line
      line(423, liney, mouseX, mouseY);
      liney = fishery - (150 - 282);
    }
    // now we switch to game screen
    if (fishery == -450) {
      game = true;
      mainscreen = false;
      start = false;
    }
  }
    
  
}
