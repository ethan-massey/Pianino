import processing.serial.*;
import processing.video.*;
import processing.sound.*;

PImage playButton;
PImage piano_background;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
String portName;
float floatVal;
char note;
char temp;
boolean alreadyPlayed;

SoundFile song;

void setup() 
{
  song = new SoundFile(this, "watermelon.mp3");
  size(747, 451);
  piano_background = loadImage("piano_background_full.png");
  background(piano_background);
  fill(153);
  stroke(153);
  
  playButton = loadImage("play_button.png");
  
  portName = Serial.list()[4]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  
  temp = '-';

  alreadyPlayed = false;
}

void draw() { 

  background(piano_background);
  if(mouseX > 390 && mouseX < 620 && mouseY > 328 && mouseY < 408){
    fill(204, 229, 255);
  }else{
    fill(153, 204, 255);
  }
  
  // play button
  stroke(255);
  rect(390, 328, 230, 80);
  image(playButton, 445, 335);
  
  // reset fill and stroke
  fill(153);
  stroke(153);
  
   if(keyPressed) {
    switch(key){
      case 'q':
        note = 'c';
        //rect(13, 15, 19, 174);
        rect(94, 94, 19, 174);
        rect(13+81, 130+79, 32, 60);
        break;
      case '2':
        note = '0';
        rect(38+80, 15+79, 20, 110);
        break;
      case 'w':
        note = 'd';
        rect(64+80, 15+79, 7, 174);
        rect(51+80, 130+79, 32, 60);
        break;
      case '3':
        note = '1';
        rect(76+80, 15+79, 20, 110);
        break;
      case 'e':
        note = 'e';
        rect(89+80, 130+79, 30, 60);
        rect(101+80, 15+79, 19, 174);
        break;
      case 'r':
        note = 'f';
        rect(126+80, 15+79, 19, 174);
        rect(126+80, 130+79, 32, 60);
        break;
      case '5':
        note = '2';
        rect(151+80, 15+79, 20, 110);
        break;
      case 't':
        note = 'g';
        rect(176+80, 15+79, 7, 174);
        rect(163+81, 130+79, 32, 60);
        break;
      case '6':
        note = '3';
        rect(188+80, 15+79, 20, 110);
        break;
      case 'y':
        note = 'a';
        rect(214+80, 15+79, 7, 174);
        rect(201+80, 130+79, 32, 60);
        break;
      case '7':
        note = '4';
        rect(226+80, 15+79, 20, 110);
        break;
      case 'u':
        note = 'b';
        rect(239+80, 130+79, 30, 60);
        rect(251+80, 15+79, 19, 174);
        break;
      case 'z':
      case 'i':
        note = 'C';
        rect(276+80, 15+79, 19, 174);
        rect(276+80, 130+79, 32, 60);
        break;
      case '9':
      case 's':
        note = '5';
        rect(301+80, 15+79, 20, 110);
        break;
      case 'o':
      case 'x':
        note = 'D';
        rect(326+80, 15+79, 7, 174);
        rect(313+80, 130+79, 32, 60);
        break;
      case '0':
      case 'd':
        note = '6';
        rect(338+80, 15+79, 20, 110);
        break;
      case 'p':
      case 'c':
        note = 'E';
        rect(351+80, 130+79, 30, 60);
        rect(364+80, 15+79, 19, 174);
        break;
      case 'v':
        note = 'F';
        rect(389+80, 15+79, 19, 174);
        rect(389+80, 130+79, 32, 60);
        break;
      case 'g':
        note = '7';
        rect(413+80, 15+79, 20, 110);
        break;
      case 'b':
        note = 'G';
        rect(438+80, 15+79, 7, 174);
        rect(426+80, 130+79, 32, 60);
        break;
      case 'h':
        note = '8';
        rect(451+80, 15+79, 20, 110);
        break;
      case 'n':
        note = 'A';
        rect(476+80, 15+79, 7, 174);
        rect(464+80, 130+79, 32, 60);
        break;
      case 'j':
        note = '9';
        rect(488+80, 15+79, 20, 110);
        break;
      case 'm':
        note = 'B';
        rect(501+80, 130+79, 30, 60);
        rect(514+80, 15+79, 19, 174);
        break;
      case ',':
        note = '.';
        rect(539+80, 15+79, 19, 174);
        rect(539+80, 130+79, 32, 60);
        break;
    }
    
    if(temp != note){
      myPort.write(note);
    }
    temp = note;
    
  }else{
    myPort.write(';');
    temp = ';';
  }
}

void mouseClicked(){
  // play
  if(! alreadyPlayed && (mouseX > 390 && mouseX < 620 && mouseY > 328 && mouseY < 408)){
    song.play();
    alreadyPlayed = true;
  // pause
  }else if(alreadyPlayed && (mouseX > 390 && mouseX < 620 && mouseY > 328 && mouseY < 408)){
    song.pause();
    alreadyPlayed = false;
  }
}
