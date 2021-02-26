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
color LGray = #9B9B9B;
color DGray = #5A5A5A;

//Slide up menu toggle vars
boolean menutoggle;
int menuhover;
int menuY;

//Cursor vars
float cursorh;
color drawcolor;
float drawsize;

//PGraphics layers
PGraphics menu;
PGraphics canvas;

void setup() { //----------------------------------------
  size(800, 800);
  
  //Removes windows cursor
  noCursor();
  
  //Initialize menu vars
  menutoggle = false;
  menuhover = 0;
  menuY = 750;
  
  //Cursor vars
  cursorh = 1;
  drawsize = 5;
  drawcolor = Black;
  
  //Define pgraphics layers
  menu = createGraphics(800, 200);
  canvas = createGraphics(800, 750);
} //----------------------------------------

void draw() { //----------------------------------------
  background(White);

  //==== If functions ====
  movemenu();
  menubuttonh();
  
  //==== Other functions ====
  menubackground();
  
  //==== Layers ====
  image(canvas, 0, 0);
  image(menu, 0, menuY);
  cursor(mouseX, mouseY);
} //----------------------------------------

//==== Menu ====
void menubackground() {
  menu.beginDraw();
  
  //==== Background ====
  menu.strokeWeight(5);
  menu.fill(LGray);
  menu.stroke(DGray);
  
  menu.rect(0, 0, menu.width, menu.height);
  
  //==== Arrow ====
  menu.strokeWeight(4 * menuhover);
  menu.fill(White, 50);
  menu.stroke(White, 50);
  
  menu.line(375, 30, 400, 20);
  menu.line(400, 20, 425, 30);
  
  //==== Colour selectors ====
  //--Navy--
  menu.strokeWeight(3);
  menu.fill(Navy1);
  menu.stroke(Navy2);
  menu.rect(50, 60, 100, 50);
  
  menu.endDraw();
}

//===== Check if menu button is being hovered ====
void menubuttonh() {
  if (mouseY >= menuY && mouseY <= menuY + 50 && menuY != 600) {
    menuhover = 2;
    cursorh = 1.2;
  } else if (mouseY < menuY || menuY != 750) {
    menuhover = 0;
    cursorh = 1;
  }
}

//==== Set cursor colour to navy if you click on navy button ====
void navybutton() {
  if (mouseX > 50 && mouseX < 150 && mouseY > menuY + 60 && mouseY < menuY + 110) {
    drawcolor = Navy3;
  }
}

//==== Make menu move ====
void movemenu() {
  if (menutoggle == true && menuY != 600) {
    menuY = menuY - 5;
  } else if (menutoggle == false && menuY != 750) {
    menuY = menuY + 5;
  }
}

//==== Cursor ====
void cursor(int x, int y) {
  strokeWeight(drawsize);
  fill(White, 0);
  // Colour of cursor ring
  stroke(drawcolor);
  
  //Cursor expands when hovered over a button
  ellipse(x, y, 15 * cursorh, 15 * cursorh); 
}

//==== For drawing ====
void mouseDragged() {
  if (mouseY <= menuY) {
    canvas.beginDraw();
  
    //==== Parameters change to match cursor ====
    canvas.strokeWeight(drawsize);
    canvas.stroke(drawcolor);
    canvas.fill(drawcolor);
    canvas.line(pmouseX, pmouseY, mouseX, mouseY);
  
    canvas.endDraw();
  }
}

void mouseReleased() {
  //==== Menu button toggle at bottom of screen ====
  if (mouseY >= menuY && mouseY <= menuY + 50) {
    menutoggle = true;
  } else if (mouseY <= 600) {
    menutoggle = false;
  }
  
  //==== Colour button funcs ====
  navybutton();
}
