import processing.sound.*;


int circleX, circleY;
int circle2X, circle2Y;
int circle3X, circle3Y;
int circle4X, circle4Y;
int circle5X, circle5Y;
int circle6X, circle6Y;// Position of circle button
int circleSize = 93; 
int  lastTimeMouseMoved = 0;
int howMuchTimeSinceMove = 0;
int currentFloor = 0;

PImage openDoorButton;
PImage openEmergencyButton;
PImage ipadBorder;
PImage upArrow;
PImage downArrow;

//loading bar
int per = 0;



color circleColor1;
color circleColor2;
color circleColor3;
color circleColor4;
color circleColor5;
color circleColor6;

color circleHighlight1;
color circleHighlight2;
color baseColor;
color currentColor;
boolean circle1Over = false;
boolean circle2Over = false;
boolean circle3Over = false;
boolean circle4Over = false;
boolean circle5Over = false;
boolean circle6Over = false;
boolean circle1Selected = false;
boolean circle2Selected = false;
boolean circle3Selected = false;
boolean circle4Selected = false;
boolean circle5Selected = false;
boolean circle6Selected = false;
boolean buttonSelected;
boolean switchToLoading = false;
boolean lockMouse = false;
boolean switchingFloors = false;
boolean goingUp = true;
boolean goingDown = false;

SoundFile file;
SoundFile file2;
SoundFile file3;
SoundFile file4;
SoundFile file5;
SoundFile file6;


PFont f;





// The statements in the setup() block run once 
// when the program begins
void setup() {
  size(768, 900); // Size must be the first statement
                 
  file = new SoundFile(this, "First Floor.wav");
  file2 = new SoundFile(this, "Second Floor.wav");
  file3 = new SoundFile(this, "Third Floor.wav");
  file4 = new SoundFile(this, "Fourth Floor.wav");
  file5 = new SoundFile(this, "Elevator Door.wav");
  file6 = new SoundFile(this, "Emergency Button.wav");
  
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  
  
  openDoorButton = loadImage("OpenElevatorButton2.png");
  openEmergencyButton = loadImage("ElevatorEmergencyButton.png");
  ipadBorder = loadImage("ipadBorder.png");
  upArrow = loadImage("upArrow2.png");
  downArrow = loadImage("downArrow3.png");
  
  circleColor1 = color(255);
  circleColor2 = color(255);
  circleColor3 = color(255);
  circleColor4 = color(255);
  circleColor5 = color(255);
  circleColor6 = color(255);
 // circleHighlight1 = color(255);
  //circleHighlight2 = color(255);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = width/2;
  circleY = (height - 50) - (height/5 -20);
  circle2X = width/2;
  circle2Y = (height - 50) - 2*(height/5  - 20);
  circle3X = width/2;
  circle3Y = (height - 50) - 3*(height/5 - 20);
  circle4X = width/2;
  circle4Y = (height- 50) - 4*(height/5 - 20);
  circle5X = width/4;
  circle5Y = (height - 50) - (height/5 - 20);
  circle6X = width - width/4;
  circle6Y = (height - 50) - (height/5 - 20);
 
 
  
  ellipseMode(CENTER);
  
  
}

// The statements in draw() are run until the program 
// is stopped. Each statement is run in sequence from top 
// to bottom and after the last line is read, the 
// first line is run again.
void draw() { 
  background(50,50,50); // Clear the screen with a black background
  updateOne(mouseX, mouseY); //updates for botton 1
  updateTwo(mouseX, mouseY); // updates for button 2
  updateThree(mouseX, mouseY);
  updateFour(mouseX, mouseY);
  updateFive(mouseX, mouseY);
  updateSix(mouseX,mouseY);
  
  
  if(switchToLoading == false)
  {
     howMuchTimeSinceMove = millis() - lastTimeMouseMoved;
  }
  if(switchToLoading == true)
  {
    howMuchTimeSinceMove = 5000;
  }
  
  
   
   if(circle1Selected == true || circle2Selected == true || circle3Selected == true || circle4Selected == true)
   {
     buttonSelected = true;
    
   }
   else
   {
     buttonSelected = false;
   }
   
   //if all 4 elevator button have been selected
   if(circle1Selected == true && circle2Selected == true && circle3Selected == true && circle4Selected == true)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255,0,0);
  }
  
  
  //if 1 2 and 3 selected but not 4
  
   if(circle1Selected == true && circle2Selected == true && circle3Selected == true && circle4Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255);
  }
   
   //if 1 2 and 3 selected and 4 is hovered over
   
    if(circle1Over == false && circle2Over == false && circle3Over == false && circle4Over == true && circle1Selected == true && circle2Selected == true && circle3Selected == true && circle4Selected == false )
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255,0,0);
     circleColor4 = color(204);
  }
   
   
   //if button 1 is selected and button two and 3 and 4 are not hovered over
   
   if(circle2Over == false && circle3Over == false && circle4Over == false && circle1Selected == true && circle2Selected == false &&  circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255);
     circleColor3 = color(255);
     circleColor4 = color(255);
  }
  
  //if button 1 is selected and button two is hovered over 
  
   if(circle2Over == true && circle3Over == false && circle1Selected == true && circle2Selected == false && circle3Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(204);
     circleColor3 = color(255);
  }
   
   
    //if button 1 is selected and button 3 is hovered over 
   if(circle2Over == false && circle3Over == true && circle4Over == false && circle1Selected == true && circle2Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255);
     circleColor3 = color(204);
     circleColor4 = color(255);
  }
  
  //if button 1 is selected and button 4 is hovered over 
   if(circle2Over == false && circle3Over == false && circle4Over == true && circle1Selected == true && circle2Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255);
     circleColor3 = color(255);
     circleColor4 = color(204);
  }
  
  
  
  
   //if button 1 is selected and button 2 is selected and button 3 and 4 are not hovered over 
   if(circle3Over == false && circle4Over == false && circle1Selected == true && circle2Selected == true && circle3Selected == false && circle4Selected == false)
  { 
     circleColor1 = color(255,0,0);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255);
     circleColor4 = color(255);
  }
  
  //if button 1 is selected and button 2 is selected and button 4 is hovered over 
   if(circle3Over == false && circle4Over == true && circle1Selected == true && circle2Selected == true && circle3Selected == false && circle4Selected == false)
  { 
     circleColor1 = color(255,0,0);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255);
     circleColor4 = color(204);
  }
  
  //if button 2 is selected and button 3 is selected and button 1 and 4  are not hovered over 
   if(circle1Over == false && circle4Over == false && circle2Selected == true && circle3Selected == true && circle1Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255);
  }
  
  //if button 2 is selected and button 3 is selected and button 1 is hovered over and 4 is not
   if(circle1Over == true && circle4Over == false && circle2Selected == true && circle3Selected == true && circle1Selected == false && circle4Selected == false)
  {
     circleColor1 = color(204);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255);
  }
  
   //if button 2 is selected and button 3 is selected and button 4 is hovered over and 1 is not
   if(circle1Over == false && circle4Over == true && circle2Selected == true && circle3Selected == true && circle1Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255,0,0);
     circleColor4 = color(204);
  }
  
  //if button 1 is selected and button 3 is selected and button 2 and 4 are not hovered over 
   if(circle2Over == false && circle4Over == false && circle1Selected == true && circle3Selected == true && circle2Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255);
  }
  
  //if button 1 is selected and button 3 is selected and button 2 is hovered over and not 4
   if(circle2Over == true && circle4Over == false && circle1Selected == true && circle3Selected == true && circle2Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(204);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255);
     
  }
  
  //if button 1 is selected and button 3 is selected and button 4 is hovered over and not 2
   if(circle2Over == false && circle4Over == true && circle1Selected == true && circle3Selected == true && circle2Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255);
     circleColor3 = color(255,0,0);
     circleColor4 = color(204);
     
  }
  
  
  
     //if button 1 is selected and button 2 is selected and button 3 is hovered over and button 4 is not
   if( circle3Over == true && circle4Over == false && circle1Selected == true && circle2Selected == true && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255,0,0);
     circleColor3 = color(204);
     circleColor4 = color(255);
  }
  
   //if button 2 is selected and button 1 and 3 and 4 are not hovered over
   
   if(circle1Over == false && circle3Over == false && circle4Over == false && circle2Selected == true && circle1Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255);
     circleColor4 = color(255);
  }
   
   
   
   
   
   //if button 2 is selected and button 1 is hovered over and 3 and 4 are not
   
    if(circle1Over == true && circle3Over == false && circle4Over == false && circle2Selected == true && circle1Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(204);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255);
     circleColor4 = color(255);
     
  }
  
  //if button 2 is selected and button 3 is hovered over and 1 and 4 are not
   
    if(circle1Over == false && circle3Over == true  && circle4Over == false && circle2Selected == true && circle1Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255,0,0);
     circleColor3 = color(204);
     circleColor4 = color(255);
  }
  
  //if button 2 is selected and button 4 is hovered over and 1 and 3 are not
   
    if(circle1Over == false && circle3Over == false  && circle4Over == true && circle2Selected == true && circle1Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255);
     circleColor4 = color(204);
  }
   
   
   //if button 3 is selected and button 1 and 2 are not hovered over
   if(circle1Over == false && circle2Over == false && circle4Over == false && circle1Selected == false && circle2Selected == false && circle3Selected == true && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255);
  }
  
  //if button 3 is selected and button 1 is hovered over
   if(circle1Over == true && circle2Over == false && circle4Over == false && circle1Selected == false && circle2Selected == false && circle3Selected == true && circle4Selected == false)
  {
     circleColor1 = color(204);
     circleColor2 = color(255);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255);
  }
  
   //if button 3 is selected and button 2 is hovered over
   if(circle1Over == false && circle2Over == true && circle4Over == false && circle1Selected == false && circle2Selected == false && circle3Selected == true && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(204);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255);
  }
  
   //if button 3 is selected and button 4 is hovered over
   if(circle1Over == false && circle2Over == false && circle4Over == true && circle1Selected == false && circle2Selected == false && circle3Selected == true && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255);
     circleColor3 = color(255,0,0);
     circleColor4 = color(204);
  }
   
   
   //if button 4 is selected and none of the others
   if(circle1Over == false && circle3Over == false && circle2Over == false && circle2Selected == false && circle1Selected == false && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255);
     circleColor2 = color(255);
     circleColor3 = color(255);
     circleColor4 = color(255,0,0);
  }
  
  
  //if button 4 is selected and 1 is hovered over 
   if(circle1Over == true && circle3Over == false && circle2Over == false && circle2Selected == false && circle1Selected == false && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(204);
     circleColor2 = color(255);
     circleColor3 = color(255);
     circleColor4 = color(255,0,0);
  }
  
  
   //if button 4 is selected and 2 is hovered over 
  
    if(circle1Over == false && circle3Over == false && circle2Over == true && circle2Selected == false && circle1Selected == false && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255);
     circleColor2 = color(204);
     circleColor3 = color(255);
     circleColor4 = color(255,0,0);
  }
  
  
  //if button 4 is selected and 3 is hovered over 
  
    if(circle1Over == false && circle3Over == true && circle2Over == false && circle2Selected == false && circle1Selected == false && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255);
     circleColor2 = color(255);
     circleColor3 = color(204);
     circleColor4 = color(255,0,0);
  }
  
  
  
  //if button 4 and 3 are selected and none is hovered over 
  
    if(circle1Over == false &&  circle2Over == false && circle2Selected == false && circle1Selected == false && circle3Selected == true && circle4Selected == true)
  {
     circleColor1 = color(255);
     circleColor2 = color(255);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255,0,0);
  }
  
  
  //if button 4 and 3 are selected and 1 is hovered over 
  
    if(circle1Over == true &&  circle2Over == false && circle2Selected == false && circle1Selected == false && circle3Selected == true && circle4Selected == true)
  {
     circleColor1 = color(204);
     circleColor2 = color(255);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 3 are selected and 2 is hovered over 
  
    if(circle1Over == false &&  circle2Over == true && circle2Selected == false && circle1Selected == false && circle3Selected == true && circle4Selected == true)
  {
     circleColor1 = color(255);
     circleColor2 = color(204);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 3 and 2 are selected and  none hovered
  
    if(circle1Over == false &&  circle2Selected == true && circle1Selected == false && circle3Selected == true && circle4Selected == true)
  {
     circleColor1 = color(255);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 3 and 2 are selected and 1 hovered
  
    if(circle1Over == true &&  circle2Selected == true && circle1Selected == false && circle3Selected == true && circle4Selected == true)
  {
     circleColor1 = color(204);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 1  are selected and  none hovered
  
    if(circle2Over == false && circle3Over == false &&  circle2Selected == false && circle1Selected == true && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255);
     circleColor3 = color(255);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 1  are selected and 2 hovered
  
    if(circle2Over == true && circle3Over == false &&  circle2Selected == false && circle1Selected == true && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(204);
     circleColor3 = color(255);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 1  are selected and 3 hovered
  
    if(circle2Over == false && circle3Over == true &&  circle2Selected == false && circle1Selected == true && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255);
     circleColor3 = color(204);
     circleColor4 = color(255,0,0);
  }
  
   //if button 4 and 2  are selected and none hovered
  
    if(circle1Over == false && circle3Over == false &&  circle2Selected == true && circle1Selected == false && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 2  are selected and 1 hovered
  
    if(circle1Over == true && circle3Over == false &&  circle2Selected == true && circle1Selected == false && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(204);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 2  are selected and 3 hovered
  
    if(circle1Over == false && circle3Over == true &&  circle2Selected == true && circle1Selected == false && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255);
     circleColor2 = color(255,0,0);
     circleColor3 = color(204);
     circleColor4 = color(255,0,0);
  }
  
  
  //if button 4 and 2 and 1  are selected and none hovered
  
    if(circle3Over == false &&  circle2Selected == true && circle1Selected == true && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255,0,0);
     circleColor3 = color(255);
     circleColor4 = color(255,0,0);
  }
  
   //if button 4 and 2 and 1  are selected and 3 hovered
  
    if(circle3Over == true &&  circle2Selected == true && circle1Selected == true && circle3Selected == false && circle4Selected == true)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255,0,0);
     circleColor3 = color(204);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 3 and 1  are selected and none hovered
  
    if(circle2Over == false &&  circle2Selected == false && circle1Selected == true && circle3Selected == true && circle4Selected == true)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(255);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255,0,0);
  }
  
  //if button 4 and 3 and 1  are selected and 2 hovered
  
    if(circle2Over == true &&  circle2Selected == false && circle1Selected == true && circle3Selected == true && circle4Selected == true)
  {
     circleColor1 = color(255,0,0);
     circleColor2 = color(204);
     circleColor3 = color(255,0,0);
     circleColor4 = color(255,0,0);
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   
   
   //if the first button is hovered over and none have been selected
   
   if(circle1Over == true && circle2Over == false && circle3Over == false && circle4Over == false && circle1Selected == false && circle2Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(204);
     circleColor2 = color(255);
     circleColor3 = color(255);
     circleColor4 = color(255);
  }
   
  //if the second button is hovered over and none of the others have been selected
  
  if(circle1Over == false && circle2Over == true && circle3Over == false && circle4Over == false && circle1Selected == false && circle2Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(204);
     circleColor3 = color(255);
     circleColor4 = color(255);
  }
   //if the third button is hovered over and none of the others have been selected
  if(circle1Over == false && circle2Over == false && circle3Over == true && circle4Over == false && circle1Selected == false && circle2Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255);
     circleColor3 = color(204);
     circleColor4 = color(255);
  }
  
  
  //if the fourth button is hovered over and none of the others have been selected
  if(circle1Over == false && circle2Over == false && circle3Over == false && circle4Over == true && circle1Selected == false && circle2Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255);
     circleColor3 = color(255);
     circleColor4 = color(204);
  }
  
  
  
  if(circle1Over == false && circle2Over == false && circle3Over == false && circle4Over == false && circle1Selected == false && circle2Selected == false && circle3Selected == false && circle4Selected == false)
  {
     circleColor1 = color(255);
     circleColor2 = color(255);
     circleColor3 = color(255);
     circleColor4 = color(255);
  }
  
  
  
  if(circle5Selected == true)
  {
    circleColor5 = color(255,0,0);
    //if cicle5 selected then reset timer to zero
    lastTimeMouseMoved = millis();
    circle5Selected = false;
    
    
  }
 
  
  //button5 turning off
  
  if(howMuchTimeSinceMove >= 2000)
  {
    circleColor5 = color(255);
    
  }
   //circle 6 is an emergency button
   
   
   
  if(circle6Over == false)
  {
    circleColor6 = color(255);
    
  }
  
   
   
  if(circle6Selected == true)
  {
    circleColor6 = color(255,0,0);
    //if cicle5 selected then reset timer to zero
    howMuchTimeSinceMove = 0;
    
    //continue from here
    
    
  }
  
  
  
  
  
  
   print(howMuchTimeSinceMove + "\n");
  
  if(howMuchTimeSinceMove >= 5000  && buttonSelected == true)
  {
    switchToLoading = true;
  }
  else 
  {
    switchToLoading = false;
  }
  
  
  if(switchToLoading == false)
  {
     strokeWeight(5);
    stroke(0);
    fill(circleColor1);
    ellipse(circleX, circleY, circleSize, circleSize);
    fill(circleColor2);
    strokeWeight(5);
    stroke(0);
    ellipse(circle2X, circle2Y, circleSize, circleSize);
    fill(circleColor3);
    strokeWeight(5);
    stroke(0);
    ellipse(circle3X, circle3Y, circleSize, circleSize);
    fill(circleColor4);
    strokeWeight(5);
    stroke(0);
    ellipse(circle4X, circle4Y, circleSize, circleSize);
    fill(circleColor5);
    strokeWeight(5);
    stroke(0);
    ellipse(circle5X, circle5Y, circleSize, circleSize);
    fill(circleColor6);
    strokeWeight(5);
    stroke(0);
    ellipse(circle6X, circle6Y, circleSize, circleSize);
    
    
    
    
    textFont(f,48);                  // STEP 3 Specify font to be used
  fill(0);                         // STEP 4 Specify font color
  text("1",circleX - 13,circleY + 12); 
  text("2",circle2X - 13,circle2Y + 12); 
  text("3",circle3X - 13,circle3Y + 12);
  text("4",circle4X - 13,circle4Y + 12);
  image(openDoorButton, circle5X-56, circle5Y-65,width/7,height/7);
  image(openEmergencyButton, circle6X-47, circle6Y-45,width/8,height/8);
  image(ipadBorder, 0 -115, 0 - 10, width * 1.3, height * 1.02);
  
  }
  else if(switchToLoading == true)
  {
 
   image(ipadBorder, 0 -115, 0 - 10, width * 1.3, height * 1.02);
    int c1 = 1;
    int c2 = 2;
    int c3 = 3;
    int c4 = 4;
    
    
    
    
     if(circle1Selected == true && currentFloor == 0)
    {
      goingUp = true;
      goingDown = false;
      
    }
    
     if(circle1Selected == true && currentFloor == 1)
    {
      goingUp = true;
      goingDown = false;
      
    }
    
     if(circle1Selected == true && currentFloor == 2)
    {
      goingUp = false;
      goingDown = true;
      
    }
    
    if(circle1Selected == true && currentFloor == 3)
    {
      goingUp = false;
      goingDown = true;
      
    }
    
    if(circle1Selected == true && currentFloor == 4)
    {
      goingUp = false;
      goingDown = true;
      
    }
    
    
    
    
    
    if(circle2Selected == true && currentFloor == 0)
    {
      goingUp = true;
      goingDown = false;
      
    }
    
    if(circle2Selected == true && currentFloor == 1)
    {
      goingUp = true;
      goingDown = false;
      
    }
    
    if(circle2Selected == true && currentFloor == 3)
    {
        goingDown = true;
        goingUp = false;
      
    }
    
    if(circle2Selected == true && currentFloor == 4)
    {
        goingDown = true;
        goingUp = false;
      
    }
    
    
    if(circle3Selected == true && currentFloor == 0)
    {
        goingDown = false;
        goingUp = true;
      
    }
    
     if(circle3Selected == true && currentFloor == 1)
    {
        goingDown = false;
        goingUp = true;
      
    }
    
      if(circle3Selected == true && currentFloor == 2)
    {
        goingDown = false;
        goingUp = true;
      
    }
    
     if(circle3Selected == true && currentFloor == 4)
    {
        goingDown = true;
        goingUp = false;
      
    }
    
    if(circle4Selected == true && currentFloor == 0)
    {
        goingDown = false;
        goingUp = true;
      
    }
    
    if(circle4Selected == true && currentFloor == 1)
    {
        goingDown = false;
        goingUp = true;
      
    }
    
    if(circle4Selected == true && currentFloor == 2)
    {
        goingDown = false;
        goingUp = true;
      
    }
    
    if(circle4Selected == true && currentFloor == 3)
    {
        goingDown = false;
        goingUp = true;
      
    }
    
     if(circle4Selected == true && currentFloor == 4)
    {
        goingDown = true;
        goingUp = false;
      
    }
    
    
    
    
    //if we on floor 1 we must go up
    if(circle1Selected == true && currentFloor == 0)
    {
      goingUp = true;
      
    }
    
    
    
    
    
   if(goingUp == true)
   {
    textFont(f,48);                  // STEP 3 Specify font to be used
    fill(255,255,255);     
   
   
    image(upArrow, width -200, height-820,width/8,height/8);
   
      if(circle1Selected == true)
      {
         text("You are on floor 1",200,400); 
          //text("1",circleX + 320 ,circleY + 12); 
          per = (per + 1) % 100;
         // textFont(f,48);
         // text("Loading... " + per + "%" , 400 / 4, 400 / 2.5);
         // rect(400/4, 400 /2, per * 2, 20, 7);
          if(per == 98)
          {
            print("1");
            circle1Selected = false;
            switchToLoading = false;
            currentFloor = 1;
          }
          
          
          
          
        
      }
      else if(circle2Selected == true) 
      {
        text("Moving to floor 2",200,400); 
          //text("1",circleX + 320 ,circleY + 12); 
          per = (per + 1) % 100;
          textFont(f,48);
          text("Trip " + per + "%" + " Complete", 400 / 4, 400 / 2.5);
          rect(200, 450 , per * 4, 20, 7);
          if(per == 98)
          {
            print("2");
            circle2Selected = false;
            switchToLoading = false; 
            currentFloor = 2;
          }
        
      }
      else if(circle3Selected == true)
      {
        text("Moving to floor 3",200,400); 
          //text("1",circleX + 320 ,circleY + 12); 
          per = (per + 1) % 100;
          textFont(f,48);
          text("Trip " + per + "%" + " Complete", 400 / 4, 400 / 2.5);
          rect(200, 450, per * 4, 20, 7);
          if(per == 98)
          {
            circle3Selected = false;
            switchToLoading = false;
            currentFloor = 3;
          }
        
      }
      
      
      else if(circle4Selected == true)
      {
        
         text("Moving to floor 4",200,400); 
          //text("1",circleX + 320 ,circleY + 12); 
          per = (per + 1) % 100;
          textFont(f,48);
          text("Trip " + per + "%" + " Complete", 400 / 4, 400 / 2.5);
          rect(200, 450, per * 4, 20, 7);
          if(per == 98)
          {
            circle4Selected = false;
            //switchToLoading = false;
            currentFloor = 4;
          }
      }
      
      
    
    print("end of code");
    lastTimeMouseMoved = millis();
   
    }
  
  
  if(goingDown == true)
    {
      textFont(f,48);                  // STEP 3 Specify font to be used
      fill(255,255,255);                         // STEP 4 Specify font color
       
      image(downArrow, width -200, height-820,width/8,height/8);
   
      if(circle4Selected == true)
      {
         text("You are on Floor 4",200,400); 
          //text("1",circleX + 320 ,circleY + 12); 
          per = (per + 1) % 100;
         // textFont(f,48);
          //text("Loading... " + per + "%" , 400 / 4, 400 / 2.5);
          //rect(400/4, 400 /2, per * 2, 20, 7);
          if(per == 98)
          {
            print("1");
            circle4Selected = false;
            switchToLoading = false;
            currentFloor = 4;
          }
          
          
          
          
        
      }
      else if(circle3Selected == true) 
      {
        text("Moving to floor 3",200,400); 
          //text("1",circleX + 320 ,circleY + 12); 
          per = (per + 1) % 100;
          textFont(f,48);
          text("Loading... " + per + "%" , 400 / 4, 400 / 2.5);
          rect(200, 450, per * 4, 20, 7);
          if(per == 98)
          {
            print("2");
            circle3Selected = false;
            switchToLoading = false; 
            currentFloor = 3;
          }
        
      }
      else if(circle2Selected == true)
      {
        text("Moving to floor 2",200,400); 
          //text("1",circleX + 320 ,circleY + 12); 
          per = (per + 1) % 100;
          textFont(f,48);
          text("Loading... " + per + "%" , 400 / 4, 400 / 2.5);
          rect(200, 450, per * 4, 20, 7);
          if(per == 98)
          {
            circle2Selected = false;
            switchToLoading = false;
            currentFloor = 2;
          }
        
      }
      
      
      else if(circle1Selected == true)
      {
        
        text("Moving to floor 1",200,400); 
          //text("1",circleX + 320 ,circleY + 12); 
          per = (per + 1) % 100;
          textFont(f,48);
          text("Loading... " + per + "%" , 400 / 4, 400 / 2.5);
          rect(200, 450, per * 4, 20, 7);
          if(per == 98)
          {
            circle1Selected = false;
            //switchToLoading = false;
            currentFloor = 1;
          }
      }
      
      
    
    print("end of code");
    lastTimeMouseMoved = millis();
   
    
      
    }
  
  
  
  } 

    
   
   
   
   

   
   
  
 
  
  
  
} 

void updateOne(int x, int y) {
  
  if(overCircle(circleX, circleY, circleSize)) {
    circle1Over = true;
     
  }
  else {
    circle1Over = false;
   
  }
  
}

void updateTwo(int x, int y) {
  if(overCircle(circle2X, circle2Y, circleSize)) {
    circle2Over = true;
  }
  else {
    circle2Over = false;
   
  }
}

void updateThree(int x, int y) {
  if(overCircle(circle3X, circle3Y, circleSize)) {
    circle3Over = true;
  }
  else {
    circle3Over = false;
   
  }
}

void updateFour(int x, int y) {
  if(overCircle(circle4X, circle4Y, circleSize)) {
    circle4Over = true;
  }
  else {
    circle4Over = false;
   
  }
}


void updateFive(int x, int y) {
  if(overCircle(circle5X, circle5Y, circleSize)) {
    circle5Over = true;
  }
  else {
    circle5Over = false;
   
  }
}

void updateSix(int x, int y) {
  if(overCircle(circle6X, circle6Y, circleSize)) {
    circle6Over = true;
  }
  else {
    circle6Over = false;
   
  }
}

void mousePressed() {
  if (circle1Over) {
   
    circle1Selected = true;
    //circleColor1 = color(255,0,0);
    file.play();
  }
  
  if (circle2Over) {
   
    circle2Selected = true;
    //circleColor2 = color(255,0,0);
    file2.play();
  }
  
  if (circle3Over) {
   
    circle3Selected = true;
    //circleColor2 = color(255,0,0);
    file3.play();
  }
  
   if (circle4Over) {
   
    circle4Selected = true;
    //circleColor2 = color(255,0,0);
    file4.play();
  }
  
  if (circle5Over) {
   
    circle5Selected = true;
    
    file5.play();
  }
  
  if (circle6Over) {
   
    circle6Selected = true;
    //circleColor2 = color(255,0,0);
    file6.play();
  }
  
  
  
}
 //checks to see if the mouse has not been moved in the last 5 seconds
  void mouseMoved()
  {
      //start time equal to the current program runtime
    
        
        
        lastTimeMouseMoved = millis();
        
     
     
      
      
      
      
  
   


  }



boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
   
    
  } else {
    return false;
  }
}
