// these just take care of basic keybinds
void keyPressed() {
  if (key == '\n'){
    start = true;
  }
  if (key == 'm') {
    marlinTime = true;
  }
  if (key == 'r') {
    rules = !rules;
  }
}
