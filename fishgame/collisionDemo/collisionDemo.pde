// fish game to make and eat fishies
// this just make us eat circle
int circx = 300;
int circy = 500;

int xspeed = 2;
int yspeed = 3;

int fishSpeed = -1;
int predSpeed = 1;

int multiplier;

int modtime = 100;
int predtime = 200;

int time = 1;

int urrad = 30;
int urpoints = 0;


// we make a list of our fish
Fish[] fishies = new Fish[60];

// mean fish
Fish[] preds = new Fish[60];

boolean collide = false;

boolean ate = false;

void setup() {
  size(800, 600);
  for (int f = 0; f < 60; f++) {
    fishies[f] = new Fish(800, int(random(800)), fishSpeed, 0);
  }
  for (int p = 0; p < 60; p++) {
    preds[p] = new Fish(0, int(random(800)), predSpeed, 0);
  }
}


void draw() {
  background(123, 166, 137);
  noStroke();
  textAlign(CENTER);
  fill(1);
  text("Points = " + urpoints, 400, 50); 
  

  fill(190, 115, 121);
  
  if (ate == false) {
    fill(115, 100, 180);
    circle(mouseX, mouseY, urrad);


    fill(190, 115, 121);
    
    if (time % modtime == 0) {
      for (int r = 0; r < random(1, 5); r++){
        int ind = int(random(0, 60));
        if (fishies[ind].onscreen == false) {
          fishies[ind].onscreen = true;
        }
      }
    }
    
    for (int i = 0; i < 60; i++) {
      if (fishies[i].onscreen == true) {
        fishies[i].x += fishSpeed;
        circle(fishies[i].x, fishies[i].y, urrad - 10);
  
        if (dist(mouseX, mouseY, fishies[i].x, fishies[i].y) < 20) {
          print("They touching");
          fishies[i].caught = true;
          fishies[i].onscreen = false;
          fishies[i].caught = false;
          fishies[i].x = 800;
          urpoints += 10;
          if (modtime > 1) {
            modtime -= 1;
          }
          if (urpoints % 100 == 0){
            urrad += 10;
            fishSpeed -= 1;
            predSpeed += 1;
            if (predtime > 10) {
              predtime -= 10;
              
            }
            
          }
        }
      }
    }
    
    if (time % predtime == 0) {
      for (int pr = 0; pr < int(random(1, 3)); pr++) {
        
        int indp = int(random(0, 60));
        if (preds[indp].onscreen == false) {
          preds[indp].onscreen = true;
        }
      }
    }
    
    for (int p = 0; p < 60; p++) {
      if (preds[p].onscreen == true) {
        preds[p].x += predSpeed;
        fill(98, 150, 160);
        circle(preds[p].x, preds[p].y, urrad + 10);
  
        if (dist(mouseX, mouseY, preds[p].x, preds[p].y) < urrad + 10) {
          ate = true;
            
          }
        }
      }
    }
    
  
  time += 1;
}
  
    
  
