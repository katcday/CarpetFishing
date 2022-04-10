// this plays the logic of the game as well as draws all the fish
void game() {
  background(ocean);
  imageMode(CENTER);

  if (dead == false) {
    // draws line and player's fish
    stroke(150);
    strokeWeight(1);
    line(423, 0, mouseX, mouseY - 15);
    image(mainR, mouseX, mouseY);

    // then for every time loop is executed we will generate
    // between 0 and 3 food fish
    if (time % modfood == 0) {
      // generate random number of fish and loop through num
      for (int r = 0; r < int(random(1, 3)); r++) {
        int index = int(random(0, 59));
        // we pick rnadom fihs in array and set its values to onscreen and start position
        // if its not on screen already
        if (foods[index].onscreen == false) {
          foods[index].onscreen = true;
          foods[index].y = int(random(foodH/2, 600 - foodH/2));
          foods[index].x = 800;
        }

      }
    }

    // randomly generate between 0 and 3 predators
    if (time % modpred == 0) {
      // generate random number of fish and loop through num
      for (int c = 0; c < int(random(1, 3)); c++) {
        // so we pick ranodm indexes to see if their on screen or not
        int predex = int(random(0, 59));
        // if they're not we put them onscreen and reset their start positon
        if (preds[predex].onscreen == false) {
          preds[predex].onscreen = true;
          preds[predex].y = int(random(foodH/2, 600 - foodH/2));
          preds[predex].x = 0;
        }
      }
    }
    // we will now update mrMarlin
    if (marlinTime == true) {
      fill(text);
      textSize(30);
      text("There he is!!! Let Mr. Marlin eat you!!!", 400, 50);
      // check for collision
      if (collision(mrMarlin.x, mrMarlin.y, marlin.width, marlin.height) == true) {
        game = false;
        endscreen = true;
      }
      else {
        image(marlin, mrMarlin.x, mrMarlin.y);
        mrMarlin.x += mrMarlin.xspeed;
      }
    }

    // next we need to draw all fish and check for collisions
     // we loop through both predators and food at the same time
    for (int i = 0; i < 60; i++) {
      if (preds[i].onscreen == true) {
        // if there is a collision w a predator the game is over
        if (collision(preds[i].x + 5, preds[i].y + 5, predH - (.4 * predH), predR.width - (.4 * predR.width)) == true) {
          dead = true;
        }
        // otherwise we draw the predator
        else {
          image(predR, preds[i].x, preds[i].y);
          preds[i].x += predSpeed;
          if (preds[i].x >= 800 + predR.width/2) {
            preds[i].onscreen = false;
            preds[i].x = 0 - predR.width/2;
          }
        }
      }
      if (foods[i].onscreen == true) {
        // if a collision between the mouse and the fish is detected then the fish dissappears
        if (collision(foods[i].x, foods[i].y, foodH, foodR.width) == true) {
          foods[i].onscreen = false;
          foods[i].x = 800;
          
          // we also give the player points
          points += 10;
          
          // we also need to check if this is 800 points
          // if so we will add the marlin to the game
          if (points >= 720) {
            marlinTime = true;
          }
            
          // everytime the player gets 100 points, the game will speed up
          // and everything gets bigger
          if (points % 100 == 0) {
            
            foodSpeed -= 1;
            predSpeed += 2;
            
            // we will make more fish and predators faster
            if (modfood > 10) {
              modfood -= 10;
            }
            if (modpred > 50) {
              modpred -= 15;
              print(modpred);
            }
            
            // we will increase all fish sizes by 10
            mainH += 10;
            foodH += 10;
            predH += 10;
            
            // then we resize their images
            mainR = loadImage("mainc.png");
            mainR.resize(0, mainH);
            
            predR = loadImage("predc.png");
            predR.resize(0, predH);
            
            foodR = loadImage("foodc.png");
            foodR.resize(0, foodH);
          }
            
        }
        // otherwise it still gets drawn
        else {
          image(foodR, foods[i].x, foods[i].y);
          foods[i].x += foodSpeed;
        }
      }
    }
    // if not marlin time we will draw points
    if (marlinTime == false) {
      textSize(20);
      fill(text);
      text("Points: " + points, 65, 30);
    }
    time += 1;
  }
  if (dead == true) {
    endscreen = true;
  }
}
