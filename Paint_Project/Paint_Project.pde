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
color Crimson = #990000;
color MCrimson = #5c0000;
color DCrimson = #521111;
color Green = #0f3923;
color MGreen = #0c2d1c;
color DGreen = #06170e;
color Yellow = #FFFF00;
color DLGray = #222222;
color DDGray = #111111;
color LLGray = #D6D6D6;
color LDGray = #ADADAD;
color Gold = #D4AF37;

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
PGraphics cursor;

//Lock toggle var
boolean lock;

//Slider x value
int sliderx;

//Custom stamps
PImage stamp1;
boolean image1;
boolean stamp1cursor;

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
  cursor = createGraphics(800, 800);
  
  //Init. lock var
  lock = false;
  
  //Slider x value init
  sliderx = 525;
  
  //Image booleans
  image1 = false;
  stamp1cursor = false;
} //----------------------------------------

void draw() { //----------------------------------------
  background(White);

  //==== If functions ====
  movemenu();
  menubuttonh();
  cursorhlock();
  
  //==== Other functions ====
  menubackground();
  cursorf(mouseX, mouseY);
  
  //==== Layers ====
  image(canvas, 0, 0);
  image(menu, 0, menuY);
  image(cursor, 0, 0);
  
  //==== Slider -> line thickness ====
  drawsize = map(sliderx, 400, 650, 1, 16);
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
  
  //==== Lock button (Keeps the menu tray up if you click somewhere else) ====
  menu.strokeWeight(2);
  
  if (lock == false) {
    menu.noFill();
  } else if (lock == true) {
    menu.fill(Yellow);
  }
  
  menu.ellipse(780, 20, 20, 20);
  
  //==== Colour selectors ====
  //--Navy--
  menu.strokeWeight(3);
  menu.fill(Navy1);
  menu.stroke(Navy4);
  menu.rect(50, 60, 100, 50);
  //--Crimson--
  menu.strokeWeight(3);
  menu.fill(Crimson);
  menu.stroke(DCrimson);
  menu.rect(160, 60, 100, 50);
  //--Green--
  menu.strokeWeight(3);
  menu.fill(Green);
  menu.stroke(DGreen);
  menu.rect(270, 60, 100, 50);
  //--Black--
  menu.strokeWeight(3);
  menu.fill(DLGray);
  menu.stroke(DDGray);
  menu.rect(100, 120, 100, 50);
  //--White/Eraser--
  menu.strokeWeight(3);
  menu.fill(LLGray);
  menu.stroke(LDGray);
  menu.rect(210, 120, 100, 50);
  
  
  //==== Thickness slider ====
  //--Line--
  menu.strokeWeight(6);
  menu.stroke(DLGray);
  menu.line(400, 75, 650, 75);
  menu.line(400, 70, 400, 80);
  menu.line(650, 70, 650, 80);
  //--Circle--
  menu.strokeWeight(4);
  menu.noFill();
  menu.stroke(DDGray);
  menu.ellipse(sliderx, 75, 30, 30);
  
  //==== Image stamps ====
  menu.strokeWeight(6);
  menu.stroke(DLGray);
  menu.noFill();
  //--Stamp1--
  menu.rect(400, 100, 60, 60);
  menu.line(430, 115, 430, 145);
  menu.line(415, 130, 445, 130);
  //--Stamp2--
  menu.rect(483.333, 100, 60, 60);
  //--Stamp3--
  menu.rect(566.666, 100, 60, 60);
  //--Images--
  if (stamp1 != null) {
    stamp1.resize(60, 60);
    menu.image(stamp1, 400, 100);
  }
  
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

//===================================================================
//=================== BUTTON FUNCTIONS ==============================

//==== Set cursor colour to navy if you click on the navy button ====
void navybutton() {
  if (mouseX > 50 && mouseX < 150 && mouseY > menuY + 60 && mouseY < menuY + 110) {
    drawcolor = Navy3;
  }
}

//==== Set cursor colour to crimson if you click on the crimson button ====
void crimsonbutton() {
  if (mouseX > 160 && mouseX < 260 && mouseY > menuY + 60 && mouseY < menuY + 110) {
    drawcolor = MCrimson;
  }
}

//==== Set cursor colour to green if you click on the green button ====
void greenbutton() {
  if (mouseX > 270 && mouseX < 370 && mouseY > menuY + 60 && mouseY < menuY + 110) {
    drawcolor = MGreen;
  }
}

//==== Set cursor colour to black if you click on the black button ====
void blackbutton() {
  if(mouseX > 100 && mouseX < 200 && mouseY > menuY + 120 && mouseY < menuY + 170) {
    drawcolor = Black;
  }
}

//==== Set cursor colour to white if you click on the white button ====
void eraser() {
  if(mouseX > 210 && mouseX < 320 && mouseY > menuY + 120 && mouseY < menuY + 170) {
    drawcolor = White;
  }
}
//===================================================================
//===================================================================

//==== Make menu move ====
void movemenu() {
  if (menutoggle == true && menuY != 600) {
    menuY = menuY - 5;
  } else if (menutoggle == false && menuY != 750) {
    menuY = menuY + 5;
  }
}

//==== Cursor ====
void cursorf(int x, int y) {
  cursor.beginDraw();
  cursor.clear();
  
  cursor.strokeWeight(drawsize);
  cursor.noFill();
  // Colour of cursor ring
  if (drawcolor != White) {
    cursor.stroke(drawcolor);
  } else if (drawcolor == White) {
    cursor.stroke(Gold);
  }
  
  //Cursor expands when hovered over a button
  cursor.ellipse(mouseX, mouseY, 15 * cursorh, 15 * cursorh); 
  
  //Stamps
  if (stamp1cursor == true && stamp1 != null) { 
    cursor.image(stamp1, mouseX - 25, mouseY - 25, 50, 50);
  }
    
  cursor.endDraw();
}

//==== Cursor hover effect over lock button ====
void cursorhlock() {
  if (dist(780, menuY + 20, mouseX, mouseY) < 10) {
    cursorh = 1.2;
  }
}

//==== Lock button check ====
void lock() {
  if (dist(mouseX, mouseY, 780, menuY + 20) <= 10) {
    lock = !lock;
  }
}

//==== Menu button toggle at bottom of screen ====
void menutoggle() {
  if (mouseY >= menuY && mouseY <= menuY + 50 && lock == false) {
    menutoggle = true;
  } else if (mouseY <= 600 & lock == false) {
    menutoggle = false;
  }
}

//==== Move slider with mouse ====
void slidermove() {
  if (mouseY > menuY + 60 && mouseY < menuY + 90 && mouseX > 400 && mouseX < 650) {
    sliderx = mouseX;
  }
}

//===================================================
//============== STAMP BUTTONS ======================

//==== Stamp button 1 ====
void imagebutton1check() {
  if (mouseX > 400 && mouseX < 460 && mouseY > menuY + 100 && mouseY < menuY + 160 && image1 == false) {
    selectInput("Pick an image to use as a stamp", "pickstamp1");
  }
}

void pickstamp1(File f) {
  if (f != null) {
    int n = 0;
    while (n < 10) {
      PImage pic = loadImage(f.getPath());
      n = n + 1;
      stamp1 = pic;
      image1 = true;
    }
  }
}

void usestamp() {
  if (mouseX > 400 && mouseX < 460 && mouseY > menuY + 100 && mouseY < menuY + 160 && image1 == true) {
    stamp1cursor = !stamp1cursor;
  }
}

//===================================================
//===================================================

//==== For drawing ====
void mouseDragged() {
  //==== Drawing ====
  if (mouseY <= menuY) {
    canvas.beginDraw();
  
    //==== Parameters change to match cursor ====
    canvas.strokeWeight(drawsize);
    canvas.stroke(drawcolor);
    canvas.fill(drawcolor);
    canvas.line(pmouseX, pmouseY, mouseX, mouseY);
  
    canvas.endDraw();
  }
  
  //==== Slider func ====
  slidermove();
}

void mouseReleased() {
  //==== Drawing ====
  if (mouseY <= menuY) {
    canvas.beginDraw();
  
    //==== Parameters change to match cursor ====
    canvas.strokeWeight(drawsize);
    canvas.stroke(drawcolor);
    canvas.fill(drawcolor);
    canvas.line(pmouseX, pmouseY, mouseX, mouseY);
  
    canvas.endDraw();
  }
    
  //==== Checks ====
  menutoggle();
  
  //==== Colour button funcs ====
  navybutton();
  crimsonbutton();
  greenbutton();
  blackbutton();
  eraser();
  
  //==== Lock button func ====
  lock();
  
  //==== Slider func ====
  slidermove();
  
  //==== Stamp button stuff ====
  imagebutton1check();
  usestamp();
}
