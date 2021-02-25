//Alexander Double
//Feb 24 2021
//1-4b

//Colour pallete 
color Navy1 = #23395d;
color Navy2 = #203354;
color Navy3 = #1c2e4a;
color Navy4 = #192841;
color Navy5 = #152238;
color Black = #000000;
color White = #FFFFFF;

//Slide up menu toggle vars
boolean menutoggle;
int menuhover;
int menuY;

void setup() { //----------------------------------------
  size(800, 800);
  
  //Initialize menu vars
  menutoggle = false;
  menuhover = 0;
  menuY = 750;
} //----------------------------------------

void draw() { //----------------------------------------
  background(White);
  
  //==== Drop-Down Menu ====
  if (menutoggle == true && menuY != 600) {
    menuY = menuY - 5;
  } else if (menutoggle == false && menuY != 750) {
    menuY = menuY + 5;
  }
  
  //==== Layers ====
  menubuttonh();
  menubutton(menuY);
} //----------------------------------------

void menubutton(int y) {
  //==== Background ====
  strokeWeight(5);
  fill(Navy2);
  stroke(Navy3);
  
  rect(0, y, 800, 50);
  //==== Arrow ====
  strokeWeight(4 * menuhover);
  fill(White, 50);
  stroke(White, 50);
  
  line(375, y + 30, 400, y + 20);
  line(400, y + 20, 425, y + 30);
}

void menubuttonh() {
  if (mouseY >= menuY && mouseY <= menuY + 50) {
    menuhover = 2;
  } else if (mouseY < menuY) {
    menuhover = 0;
  }
}

void mouseReleased() {
  //==== Menu button toggle at bottom of screen ====
  if (mouseY >= menuY && mouseY <= menuY + 50) {
    menutoggle = true;
  } else if (mouseY <= 600) {
    menutoggle = false;
  }
}
