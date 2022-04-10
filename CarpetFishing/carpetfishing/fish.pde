// represents our fish
class Fish {
  // their x coord
  int x;
  // their y coord
  int y;
  // the fishes xspeed
  int xspeed;
  // the fishes yspeed
  int yspeed;
  // true if it's currently on the screen
  boolean onscreen;
  // if the player hits the fish it is caught and it dissappears from the screen
  boolean caught;
  
  // constructor
  Fish(int x, int y, int xspeed, int yspeed) {
    this.x = x;
    this.y = y;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
  }
  
  void predSet() {
    this.x = 0;
    this.y = 0;
    this.xspeed = 1;
    this.yspeed = 0;
  }
  
    void foodSet() {
    this.x = 800;
    this.y = 0;
    this.xspeed = -1;
    this.yspeed = 0;
  }
}
