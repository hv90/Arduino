#include <math.h>
#include <PWM.h>

float pi = 3.14159265;

int pin_1 = 11;
int pin_2 = 10;
int pin_3 = 9;
int pin_4 = 3;

int32_t frequency = 1000;//define a frequencia de saida

int f = 1000; // frequencia do sinal simulado
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
        pwmWrite(pin_1,sinal);break;
      case 45:
        pwmWrite(pin_2,sinal);break;
      case 90:
        pwmWrite(pin_3,sinal); break;     
      case 135:
        pwmWrite(pin_4,sinal);break;
      case 180:
        pwmWrite(pin_1,sinal); break;     
      case 225:
        pwmWrite(pin_2,sinal); break;    
      case 270:
        pwmWrite(pin_3,sinal);break;
      case 315:
        pwmWrite(pin_4,sinal);break;
      
    }         
  }
}

//************************************************************
void setup() {
  // put your setup code here, to run once:

  InitTimerSafe();

  SetPinFrequencySafe(pin_1, frequency);
  SetPinFrequencySafe(pin_2, frequency);
  SetPinFrequencySafe(pin_3, frequency);
  SetPinFrequencySafe(pin_4, frequency);
  
}

//************************************************************
void loop() {
  
  outputSinal();
  
}
