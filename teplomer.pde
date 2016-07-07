import processing.serial.*;

Serial myPort;           // Create object from Serial class
char inVal;      // Data received from the serial port
float hodnota;
PFont f;
Dial dialA, dialB;
Bar barA;
Map mapA;
int i = 0;

void setup ()
{
  frameRate(100);
  size (360, 360);

  println (Serial.list());
  String portName = Serial.list()[33];
  println (portName);
  myPort = new Serial(this, portName, 57600);

  dialA = new Dial (300, 180, 180, 0, 50, "Teplota");
  //dialB = new Dial (300, 540, 180, 0, 180, "Oil Temp C");
  //barA = new Bar (850, 40, 500, 0, 10, "Oil Pressure");
  //mapA = new Map (100, 400, 300);
}

void draw()
{
  background(220);
  fill(255, 0, 0);
  noStroke();
  if (myPort.available() > 0){
  inVal = myPort.readChar();
  hodnota = float(inVal);
   }
  hodnota = map(hodnota,0,255,0,50);
  dialA.display(inVal);
  print (inVal);
  print (">");
  println (hodnota);
  
  
}