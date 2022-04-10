// function detects collisions between the player's fish and the other fish

// you input the position of the fish we are detecting collisions with
boolean collision(int fishx, int fishy, float fishH, float fishW) {
  // uses mouse coordinates and subtract from the x positions of the fish to see if its
  // less than the width
  // same with height
  if (abs(mouseX - fishx) < fishW && abs(mouseY - fishy) < fishH) {
    // returns true if there was a collision
    return true;
  }
  // false if no collision
  return false;
}
