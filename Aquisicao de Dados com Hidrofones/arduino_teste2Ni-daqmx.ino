#include <math.h>

float pi = 3.14159265;

int pin_1 = 11;
int pin_2 = 10;
int pin_3 = 9;
int pin_4 = 3;

int f = 25000; // frequencia do sinal simulado
int phi=0;
float sinal;

//************************************************************
float deg2rad(float input){
 return input*pi/180.0;  
  }

//************************************************************
float rad2deg(float input){  
  return input*180.0/pi;
  }

//************************************************************
float outputSinal(){
  float sinal;
  for(int phi = 0;phi<=360;phi=phi+45){  
    sinal = rad2deg(sin(deg2rad(2*pi*f+phi)));
    switch(phi){
      case 0:
        analogWrite(pin_1,sinal);
      case 45:
        analogWrite(pin_2,sinal);
      case 90:
        analogWrite(pin_3,sinal);      
      case 135:
        analogWrite(pin_4,sinal);
      case 180:
        analogWrite(pin_1,sinal);      
      case 225:
        analogWrite(pin_2,sinal);     
      case 270:
        analogWrite(pin_3,sinal);
      case 315:
        analogWrite(pin_4,sinal);
      
    }         
  }
}

//************************************************************
void setup() {
  // put your setup code here, to run once:
  pinMode(pin_1, OUTPUT);
  pinMode(pin_2, OUTPUT);
  pinMode(pin_3, OUTPUT);
  pinMode(pin_4, OUTPUT);
  Serial.begin(9600);
}

//************************************************************
void loop() {
  
  outputSinal();
  
}
