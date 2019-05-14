#include <Servo.h>
 
#define SERVO 7 // Porta Digital 7 PWM
 
Servo s; // Variável Servo
int pos; // Posição Servo
 
void setup ()
{
  s.attach(SERVO);
  Serial.begin(9600);
  s.write(0); // Inicia motor posição zero
}
 
void loop()
{
  for(pos = 0; pos < 180; pos++)
  {
    s.write(pos);
  delay(3);
  }
delay(500);
  for(pos = 180; pos >= 0; pos--)
  {
    s.write(pos);
    delay(3);
  }
}
